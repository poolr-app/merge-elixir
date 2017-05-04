defmodule MergeApi.TripControllerTest do
  use MergeApi.ConnCase

  alias MergeApi.Trip
  @valid_attrs %{arrival_datetime: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, end_location: 1, owning_user: 5, start_datetime: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, start_location: 3}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, trip_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    trip = Repo.insert! %Trip{}
    conn = get conn, trip_path(conn, :show, trip)
    assert json_response(conn, 200)["data"] == %{"id" => trip.id,
      "start_datetime" => trip.start_datetime,
      "arrival_datetime" => trip.arrival_datetime,
      "owning_user" => trip.owning_user,
      "start_location" => trip.start_location,
      "end_location" => trip.end_location}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, trip_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, trip_path(conn, :create), trip: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Trip, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, trip_path(conn, :create), trip: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    trip = Repo.insert! %Trip{}
    conn = put conn, trip_path(conn, :update, trip), trip: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Trip, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    trip = Repo.insert! %Trip{}
    conn = put conn, trip_path(conn, :update, trip), trip: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    trip = Repo.insert! %Trip{}
    conn = delete conn, trip_path(conn, :delete, trip)
    assert response(conn, 204)
    refute Repo.get(Trip, trip.id)
  end
end
