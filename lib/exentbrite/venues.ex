defmodule Exentbrite.Venues do
  @moduledoc """
  API for Events

  """

  @doc """
  Retrieve a venue by venue_id

  ## Example

      Exentbrite.Venues.retrieve client, 1234567890

  """
  def retrieve(client, venue_id) do
    path = "venues/#{venue_id}/"
    Exentbrite.get(path, client)
  end

  @doc """
  Create a venue under an organisation

  ## Example

      Exentbrite.Venues.create client, 33333, options

  """
  def create(client, organization_id, options \\ "") do
    path = "organizations/#{organization_id}/venues/"
    Exentbrite.post(path, client, options)
  end

  @doc """
  Update a venue by venue_id

  ## Example

      Exentbrite.Venues.update client, 1234567890, options

  """
  def update(client, venue_id, options \\ "") do
    path = "venues/#{venue_id}/"
    Exentbrite.post(path, client, options)
  end
end
