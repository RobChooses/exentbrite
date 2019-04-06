defmodule Exentbrite do
  use HTTPoison.Base
  alias Exentbrite.Client

  @user_agent [{"User-agent", "exentbrite"}]

  @doc """
  Send a GET request

  """
  def get(path, client, query_params \\ []) do
    url =
      client |> add_path_to_endpoint(path)
      |> add_params_to_url(query_params)

    make_request(
      :get,
      url,
      client.auth)
    |> decode()
  end

  @doc """
  Send a POST request

  """
  def post(path, client, body \\ "") do
    make_request(
      :post,
      client |> add_path_to_endpoint(path),
      client.auth,
      body)
    |> decode()
  end

  @doc """
  Send a PUT request

  """
  def put(path, client, body \\ "") do
    make_request(
      :put,
      client |> add_path_to_endpoint(path),
      client.auth,
      body)
    |> decode()
  end

  @doc """
  Send a PATCH request

  """
  def patch(path, client, body \\ "") do
    make_request(
      :patch,
      client |> add_path_to_endpoint(path),
      client.auth,
      body)
    |> decode()
  end

  @doc """
  Send a DELETE request

  """
  def delete(path, client, body \\ "") do
    make_request(
      :delete,
      client |> add_path_to_endpoint(path),
      client.auth,
      body)
    |> decode()
  end


  @doc """
  Make request to the API and return raw response

  """
  def make_request(method, url, auth, body \\ "", headers \\ [], options \\ []) do
    HTTPoison.request(
      method,
      url,
      body |> encode_body(),
      authorization_header(auth, @user_agent) ++ headers,
      options
    )
    |> case do
         {:ok, %{body: raw, status_code: code}} ->
           {code, raw}
         {:error, %{reason: reason}} -> {:error, reason, []}
       end
  end

  @doc """
  Authenticate through Eventbrite API using OAuth2 token (for single-user/organizer)

  ## Examples

      iex> Exentbrite.authorization_header(%{oauth2_token: "ABCDE12345"}, [])
      [{"Authorization", "Bearer 1234567890"}]

  """
  def authorization_header(%{oauth2_token: token}, headers) do
    headers ++ [{"Authorization", "Bearer #{token}"}]
  end

  @doc """
  Encode the request data to JSON

  """
  def encode_body(data), do: Poison.encode!(data)

  @doc """
  Append query parameters to url
  Source: Eduardo Gurgel Pinho, github.com/edgurgel/tentacat

  """
  def add_params_to_url(url, params) do
    url
    |> URI.parse()
    |> merge_uri_params(params)
    |> String.Chars.to_string()
  end

  @doc """
  Decode json reponse
  """
  def decode({ok, body}) do
    body
    |> Poison.decode(keys: :atoms)
    |> case do
         {:ok, parsed} -> {ok, parsed}
         _ -> {:error, body}
       end
  end

  defp merge_uri_params(uri, []), do: uri

  defp merge_uri_params(%URI{query: nil} = uri, params) when is_list(params) or is_map(params) do
    uri
    |> Map.put(:query, URI.encode_query(params))
  end

  defp merge_uri_params(%URI{} = uri, params) when is_list(params) or is_map(params) do
    uri
    |> Map.update!(:query, fn q ->
      q
      |> URI.decode_query()
      |> Map.merge(param_list_to_map_with_string_keys(params))
      |> URI.encode_query()
    end)
  end

  defp param_list_to_map_with_string_keys(list) when is_list(list) or is_map(list) do
    for {key, value} <- list, into: Map.new() do
      {"#{key}", value}
    end
  end

  defp add_path_to_endpoint(_ = %Client{endpoint: endpoint}, path) do
    endpoint <> path
  end


end
