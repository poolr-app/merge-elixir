defmodule MergeApi.Seeds.SeedTrips do
  alias MergeApi.Repo
  alias MergeApi.Trip
  
  def insert_fake_user_trips_for_locations do
    # For each user
    # Add two trips associated with them and two existing locations
  end
  def insert_fake_trip do
    Repo.insert! %Trip{
    }
  end
end
