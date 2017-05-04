defmodule MergeApi.LocationTest do
  use MergeApi.ModelCase

  alias MergeApi.Location

  @valid_attrs %{address: "some content", city: "some content", country: "some content", label: "some content", lat: "120.5", location_type: "some content", lon: "120.5", region: "some content", unit: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Location.changeset(%Location{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Location.changeset(%Location{}, @invalid_attrs)
    refute changeset.valid?
  end
end
