defmodule Soulless.RPC do
  def send(packet, client) do
    GenServer.cast(client, {:send, packet})
  end

  def fetch(packet, client) do
    GenServer.call(client, {:send, packet})
  end

  defp generate_rpc_funs(file_path, packet_type, namespace) do
    file_contents = File.read!(file_path)
    {:ok, parsed_proto, _, _, _, _} = Soulless.Protobuf.Parser.parse(file_contents)
    package = Keyword.get(parsed_proto, :package)

    for {type, service} <- parsed_proto, type == :service, into: %{} do
      service_name = Keyword.get(service, :name)

      procedures =
        Keyword.get(service, :procedures)
        |> Enum.map(fn {:rpc, rpc} ->
          build_rpc_fun(packet_type, namespace, package, service_name, rpc)
        end)

      {service_name, procedures}
    end
  end

  defp build_rpc_fun(packet_type, namespace, package, service_name, rpc) do
    {:custom, request_type} = Keyword.get(rpc, :request_type)
    function = Keyword.get(rpc, :function)
    request_module = Module.safe_concat([namespace, String.capitalize(package), request_type])
    function_name = function |> Macro.underscore() |> String.to_atom()
    is_empty = Enum.empty?(request_module.fields_defs)

    message =
      if is_empty do
        quote do
          %unquote(request_module){}
        end
      else
        quote do
          payload
        end
      end

    body =
      quote do
        %unquote(packet_type){
          kind: :request,
          body: unquote(message),
          rpc: unquote(".#{package}.#{service_name}.#{function}")
        }
      end

    if is_empty do
      quote do
        def unquote(function_name)() do
          unquote(body)
        end
      end
    else
      quote do
        def unquote(function_name)(%unquote(request_module){} = payload) do
          unquote(body)
        end
      end
    end
  end

  defmacro __using__(opts) do
    {opts, _} = Code.eval_quoted(opts)
    file = Keyword.fetch!(opts, :file)
    namespace = Keyword.fetch!(opts, :namespace)
    service_name = Keyword.fetch!(opts, :service)
    packet_type = Keyword.fetch!(opts, :packet_type)

    services = generate_rpc_funs(file, packet_type, namespace)
    Map.get(services, service_name)
  end
end
