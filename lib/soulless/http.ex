defmodule Soulless.HTTP.Response do
  defstruct [:http_version, :status_code, :status_name, :headers, :body]
end

defmodule Soulless.HTTP do
  def get(url, headers \\ []) do
    request(:get, url, headers: headers)
  end

  def get!(url, headers \\ []) do
    case get(url, headers) do
      {:ok, response} -> response
      {:error, reason} -> raise reason
    end
  end

  def post(url, body, content_type, headers \\ []) do
    request(:post, url, body: body, headers: headers, content_type: content_type)
  end

  def post!(url, body, content_type, headers \\ []) do
    case post(url, body, content_type, headers) do
      {:ok, response} -> response
      {:error, reason} -> raise reason
    end
  end

  defp request(method, url, opts) do
    http_opts = [
      ssl: [
        verify: :verify_peer,
        cacertfile: CAStore.file_path(),
        depth: 3,
        customize_hostname_check: [
          {:match_fun, :public_key.pkix_verify_hostname_match_fun(:https)}
        ]
      ]
    ]

    url = String.to_charlist(url)
    body = Keyword.get(opts, :body, nil)

    headers =
      case Keyword.fetch(opts, :headers) do
        {:ok, value} -> map_headers_to_charlist(value)
        _ -> []
      end

    content_type =
      case Keyword.fetch(opts, :content_type) do
        {:ok, value} -> String.to_charlist(value)
        _ -> nil
      end

    result =
      if is_nil(content_type) and is_nil(body) do
        :httpc.request(method, {url, headers}, http_opts, [])
      else
        :httpc.request(method, {url, headers, content_type, body}, http_opts, [])
      end

    case result do
      {:ok, {{http_version, status_code, status_name}, headers, body}} ->
        response = %Soulless.HTTP.Response{
          http_version: to_string(http_version),
          status_code: status_code,
          status_name: to_string(status_name),
          headers: map_headers_to_string(headers),
          body: maybe_map_body_to_binary(body)
        }

        {:ok, response}

      {:ok, {{http_version, status_code, status_name}, body}} ->
        response = %Soulless.HTTP.Response{
          http_version: to_string(http_version),
          status_code: status_code,
          status_name: to_string(status_name),
          headers: [],
          body: maybe_map_body_to_binary(body)
        }

        {:ok, response}

      {:error, reason} ->
        {:error, reason}
    end
  end

  defp map_headers_to_charlist(headers) do
    map_headers(headers, &String.to_charlist/1)
  end

  defp map_headers_to_string(headers) do
    map_headers(headers, &to_string/1)
  end

  defp map_headers(headers, fun) do
    for {k, v} <- headers do
      {fun.(k), fun.(v)}
    end
  end

  defp maybe_map_body_to_binary(body) when is_binary(body), do: body

  defp maybe_map_body_to_binary(body) do
    :binary.list_to_bin(body)
  end
end
