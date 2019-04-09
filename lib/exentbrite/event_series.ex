defmodule Exentbrite.EventSeries do
  @moduledoc """
  API for Event Series

  """

  @doc """
  Create an event series

  ## Example

      Exentbrite.EventSeries.create client, 1234567890, options

  """
  def create(client, organization_id, options \\ "") do
    path = "organizations/#{organization_id}/series/"
    Exentbrite.post(path, client, options)
  end

  @doc """
  Update an event series

  ## Example

      Exentbrite.EventSeries.update client, 1234567890, options

  """
  def update(client, series_parent_id, options \\ "") do
    path = "series/#{series_parent_id}/"
    Exentbrite.post(path, client, options)
  end

  @doc """
  Retrieve an event series

  ## Example

      Exentbrite.EventSeries.retrieve client, 1234567890

  """
  def retrieve(client, event_series_id) do
    path = "series/#{event_series_id}/"
    Exentbrite.get(path, client)
  end

  @doc """
  Publish an event series

  ## Example

      Exentbrite.EventSeries.publish client, 1234567890

  """
  def publish(client, event_series_id) do
    path = "series/#{event_series_id}/publish/"
    Exentbrite.post(path, client)
  end

  @doc """
  Un-publish an event series

  ## Example

      Exentbrite.EventSeries.unpublish client, 1234567890

  """
  def unpublish(client, event_series_id) do
    path = "series/#{event_series_id}/unpublish/"
    Exentbrite.post(path, client)
  end

  @doc """
  Cancel an event series

  ## Example

      Exentbrite.EventSeries.cancel client, 1234567890

  """
  def cancel(client, event_series_id) do
    path = "series/#{event_series_id}/cancel/"
    Exentbrite.post(path, client)
  end

  @doc """
  Delete an event series

  ## Example

      Exentbrite.EventSeries.delete client, 1234567890

  """
  def delete(client, event_series_id) do
    path = "series/#{event_series_id}/"
    Exentbrite.delete(path, client)
  end


end
