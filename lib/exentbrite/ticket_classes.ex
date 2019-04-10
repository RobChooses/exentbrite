defmodule Exentbrite.TicketClasses do
  @moduledoc """
  API for Ticket Class

  """

  @doc """
  Create a ticket class

  ## Example

      Exentbrite.TicketClasses.create client, 1234567890, options

  """
  def create(client, event_id, options \\ "") do
    path = "events/#{event_id}/ticket_classes/"
    Exentbrite.post(path, client, options)
  end

  @doc """
  Retrieve a ticket class

  ## Example

      Exentbrite.TicketClasses.retrieve client, 1234567890, 1234567890

  """
  def retrieve(client, event_id, ticket_class_id) do
    path = "events/#{event_id}/ticket_classes/#{ticket_class_id}/"
    Exentbrite.get(path, client)
  end

  @doc """
  Update a ticket class

  ## Example

      Exentbrite.TicketClasses.update client, 1234567890, 1234567890, options

  """
  def update(client, event_id, ticket_class_id, options \\ "") do
    path = "events/#{event_id}/ticket_classes/#{ticket_class_id}/"
    Exentbrite.post(path, client, options)
  end

  @doc """
  Delete a ticket class

  ## Example

      Exentbrite.TicketClasses.delete client, 1234567890, 1234567890

  """
  def delete(client, event_id, ticket_class_id) do
    path = "events/#{event_id}/ticket_classes/#{ticket_class_id}/"
    Exentbrite.delete(path, client)
  end
end
