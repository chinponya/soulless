defmodule Soulless.Protocol.SpectatorRPC do
  use TypedStruct

  @type cache :: %{non_neg_integer() => atom() | String.t()}

  @request_prefix "<="
  @response_prefix "=>"

  typedstruct enforce: true do
    field(:kind, :request | :response)
    field(:request_id, non_neg_integer())
    field(:rpc, String.t())
    field(:body, map())
  end

  @spec serialize(__MODULE__.t()) :: binary()
  def serialize(message) do
    prefix =
      case message.kind do
        :request -> @request_prefix
        :response -> @response_prefix
      end

    rpc =
      if message.kind == :request do
        message.rpc
      end

    body =
      message.body
      |> encode_response_body(message.rpc)
      |> Jason.encode!()

    request_id = Integer.to_string(message.request_id)

    [prefix, rpc, request_id, body]
    |> Enum.reject(&is_nil/1)
    |> Enum.join(" ")
  end

  defp encode_response_body(body, rpc) do
    case rpc do
      "Auth" -> encode_auth_response(body)
      _ -> body
    end
  end

  defp encode_auth_response(body) do
    head =
      body
      |> Map.fetch!("head")
      |> Jason.encode!()

    Map.put(body, "head", head)
  end

  @spec parse(binary(), cache()) :: {:ok, __MODULE__.t(), cache()} | {:error, String.t()}
  def parse(binary, rpc_name_cache) do
    # source: game.LiveNetMgr.Inst._socket._handleMsg
    [kind_str, rest] = String.split(binary, " ", parts: 2)

    case kind_str do
      @request_prefix -> parse_request(rest, rpc_name_cache)
      @response_prefix -> parse_response(rest, rpc_name_cache)
      _ -> {:error, "unknown message kind"}
    end
  end

  defp parse_request_id(binary) do
    case Integer.parse(binary) do
      {value, ""} -> {:ok, value}
      _ -> {:error, "invalid request ID"}
    end
  end

  defp parse_request(binary, rpc_name_cache) do
    case String.split(binary, " ", parts: 3) do
      [rpc, request_id_str, body_str] ->
        with {:ok, request_id} <- parse_request_id(request_id_str),
             {:ok, body} <- Jason.decode(body_str) do
          new_rpc_name_cache = Map.put(rpc_name_cache, request_id, rpc)

          packet = %__MODULE__{
            kind: :request,
            request_id: request_id,
            rpc: rpc,
            body: body
          }

          {:ok, {packet, new_rpc_name_cache}}
        end

      _ ->
        {:error, "invalid request chunk part count"}
    end
  end

  defp parse_response(binary, rpc_name_cache) do
    case String.split(binary, " ", parts: 2) do
      [request_id_str, body_str] ->
        with {:ok, request_id} <- parse_request_id(request_id_str),
             {:ok, body} <- Jason.decode(body_str),
             {rpc, new_rpc_name_cache} = Map.pop(rpc_name_cache, request_id),
             {:ok, body} <- parse_response_body(body, rpc) do
          packet = %__MODULE__{
            kind: :response,
            request_id: request_id,
            rpc: rpc,
            body: body
          }

          {:ok, {packet, new_rpc_name_cache}}
        end

      _ ->
        {:error, "invalid request chunk part count"}
    end
  end

  defp parse_response_body(body, rpc) do
    case rpc do
      "Auth" -> parse_auth_response(body)
      _ -> {:ok, body}
    end
  end

  defp parse_auth_response(body) do
    with {:ok, head_str} <- Map.fetch(body, "head"),
         {:ok, head} <- Jason.decode(head_str) do
      new_body = Map.put(body, "head", head)
      {:ok, new_body}
    end
  end
end
