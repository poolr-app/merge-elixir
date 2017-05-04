defmodule MergeApi.LocationView do
  use MergeApi.Web, :view

  def render("index.json", %{locations: locations}) do
    %{data: render_many(locations, MergeApi.LocationView, "location.json")}
  end

  def render("show.json", %{location: location}) do
    %{data: render_one(location, MergeApi.LocationView, "location.json")}
  end

  def render("location.json", %{location: location}) do
    %{id: location.id,
      lat: location.lat,
      lon: location.lon,
      label: location.label,
      unit: location.unit,
      address: location.address,
      city: location.city,
      region: location.region,
      country: location.country,
      location_type: location.location_type}
  end
end
