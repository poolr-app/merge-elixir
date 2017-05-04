defmodule MergeApi.TripView do
  use MergeApi.Web, :view

  def render("index.json", %{trips: trips}) do
    %{data: render_many(trips, MergeApi.TripView, "trip.json")}
  end

  def render("show.json", %{trip: trip}) do
    %{data: render_one(trip, MergeApi.TripView, "trip.json")}
  end

  def render("trip.json", %{trip: trip}) do
    %{id: trip.id,
      start_datetime: trip.start_datetime,
      arrival_datetime: trip.arrival_datetime,
      owning_user: trip.owning_user,
      start_location: trip.start_location,
      end_location: trip.end_location}
  end
end
