defmodule Soulless.RPC do
  @enforce_keys [:message, :request_module, :response_module, :namespace]
  defstruct [:message, :request_module, :response_module, :namespace]

  def send(%Soulless.RPC{} = rpc, client) do
    case rpc.request_module.encode(rpc.message) do
      {:ok, bytes} ->
        WebSockex.cast(client, {:send, bytes, rpc.namespace, rpc.response_module})

      error ->
        error
    end
  end

  def fetch(%Soulless.RPC{} = rpc, client) do
    case rpc.request_module.encode(rpc.message) do
      {:ok, bytes} ->
        GenServer.call(client, {:send, bytes, rpc.namespace, rpc.response_module})

      error ->
        error
    end
  end

  defp generate_rpc_funs(file_path, namespace) do
    file_contents = File.read!(file_path)
    {:ok, parsed_proto, _, _, _, _} = Soulless.Protobuf.Parser.parse(file_contents)
    package = Keyword.get(parsed_proto, :package)

    parsed_proto
    |> Stream.filter(fn {type, _} -> type == :service end)
    |> Stream.map(fn {_, service} ->
      service_name = Keyword.get(service, :name)

      procedures =
        Keyword.get(service, :procedures)
        |> Enum.map(fn {:rpc, rpc} ->
          build_rpc_fun(namespace, package, service_name, rpc)
        end)

      {service_name, procedures}
    end)
    |> Map.new()
  end

  defp build_rpc_fun(namespace, package, service_name, rpc) do
    {:custom, request_type} = Keyword.get(rpc, :request_type)
    {:custom, return_type} = Keyword.get(rpc, :return_type)
    function = Keyword.get(rpc, :function)
    request_module = Module.safe_concat([namespace, String.capitalize(package), request_type])
    response_module = Module.safe_concat([namespace, String.capitalize(package), return_type])
    function_name = function |> Macro.underscore() |> String.to_atom()

    message =
      if Enum.empty?(request_module.fields_defs) do
        quote do
          unquote(Macro.escape(struct(request_module)))
        end
      else
        quote do
          payload
        end
      end

    args =
      if Enum.empty?(request_module.fields_defs) do
        quote do
        end
      else
        quote do
          payload
        end
      end

    quote do
      def unquote(function_name)(unquote(args)) do
        %Soulless.RPC{
          message: unquote(message),
          request_module: unquote(request_module),
          response_module: unquote(response_module),
          namespace: unquote(".#{package}.#{service_name}.#{function}")
        }
      end
    end
  end

  defmacro __using__(opts) do
    {opts, _} = Code.eval_quoted(opts)
    file = Keyword.get(opts, :file)
    namespace = Keyword.get(opts, :namespace)
    service_name = Keyword.get(opts, :service)

    services = generate_rpc_funs(file, namespace)
    service = Map.get(services, service_name)

    for fun <- service do
      fun
    end
  end
end
