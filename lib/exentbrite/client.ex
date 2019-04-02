defmodule Exentbrite.Client do
  @moduledoc """
  Every call to Eventbrite needs an authenticated client

  """

  defstruct auth: nil, endpoint: "https://www.eventbriteapi.com/v3/"

  @type auth :: %{user: binary, password: binary} | %{access_token: binary} | %{jwt: binary}
  @type t :: %__MODULE__{auth: auth | nil, endpoint: binary}

  @doc """
  Create new client with OAuth2 access token (provided by Eventbrite) to make
  calls to Eventbrite API

  ## Examples

      iex> Exentbrite.Client.new(%{oauth2_token: "ABCDEF123456"})
      %Exentbrite.Client{auth: %{oauth2_token: "ABCDEF123456"}, endpoint: "https://www.eventbriteapi.com/v3/"}

      iex> Exentbrite.Client.new(%{oauth2_token: "ABCDEF123456"}, "https://www.eventbriteapi.com/v4/")
      %Exentbrite.Client{auth: %{oauth2_token: "ABCDEF123456"}, endpoint: "https://www.eventbriteapi.com/v4/"}

  """
  def new(auth = %{oauth2_token: _}), do: %__MODULE__{auth: auth}

  def new(auth = %{oauth2_token: _}, endpoint) do
    pnew(auth, endpoint)
  end

  defp pnew(auth, endpoint) do
    endpoint =
      if String.ends_with?(endpoint, "/") do
        endpoint
      else
        endpoint <> "/"
      end

    %__MODULE__{auth: auth, endpoint: endpoint}
  end
end

