defmodule MergeApi.TripTest do
  use MergeApi.ModelCase

  alias MergeApi.Trip

  @valid_attrs %{arrival_datetime: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, end_location: 1, owning_user: 5, start_datetime: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, start_location: 4}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Trip.changeset(%Trip{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Trip.changeset(%Trip{}, @invalid_attrs)
    refute changeset.valid?
  end
end
