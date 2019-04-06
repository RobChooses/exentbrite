defmodule Exentbrite.Organizations do
  @doc """
  List the Organizations of user ID or you as default

  ## Example

      Exentbrite.Organizations.list client
      Exentbrite.Organizations.list client, 2000

  """
  def list(client, user_param \\ "me") do
    path = "users/#{user_param}/organizations/"
    Exentbrite.get(path, client)
  end
end
