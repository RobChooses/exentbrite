defmodule Exentbrite.Events do
  @doc """
  List Events by Organization ID

  """
  def list(client, organization_id) do
    path = "organizations/#{organization_id}/events/"
    Exentbrite.get(path, client)
  end

  @doc """
  Create an event

  ## Examples

      Exentbrite.Events.create client, 666666, options

  """
  def create(client, organization_id, options \\ "") do
    path = "organizations/#{organization_id}/events/"
    Exentbrite.post(path, client, options)
  end

  @doc """
  Create an event by copying from another event id

  ## Examples

      Exentbrite.Events.create_by_copy client, 1234567890, options

  """
  def create_by_copy(client, event_id, options \\ []) do
    copy(client, event_id, options)
  end

  @doc """
  Copy the Event, creating a duplicate version of the Event with a new Event ID.
  Event is copied under the same organisation as the original Event.
  Returns the newly created Event.

  """
  def copy(client, event_id, options \\ []) do
    path = "events/#{event_id}/copy/"
    Exentbrite.post(path, client, options)
  end

  @doc """
  Delete an event

  """
  def delete(client, event_id) do
    path = "events/#{event_id}/"
    Exentbrite.delete(path, client)
  end
end
