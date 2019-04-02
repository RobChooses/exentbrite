defmodule Exentbrite do
  use HTTPoison.Base
  alias Exentbrite.Client

  @user_agent [{"User-agent", "exentbrite"}]

  @doc """
  Send a GET request

  """
  def get(path, client, query_params \\ []) do
    _url =
      client
      |> add_path_to_endpoint(path)
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
  end


  @doc """
  Make request to the API and return the json response

  """
  def make_request(method, url, auth, body \\ "", headers \\ [], options \\ []) do
    HTTPoison.request(
      method,
      url,
      body |> encode_body(),
      authorization_header(auth, @user_agent) ++ headers,
      options
    )
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

  defp add_path_to_endpoint(_ = %Client{endpoint: endpoint}, path) do
    endpoint <> path
  end


end
