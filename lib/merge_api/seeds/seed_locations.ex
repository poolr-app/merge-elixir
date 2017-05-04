defmodule MergeApi.SeedLocations do
  alias MergeApi.Location
  alias MergeApi.Repo
  alias MergeApi.Enums.LocationType

  def insert_many_fake_locations(num_loc_left \\ 250) do
    insert_fake_location
    insert_many_fake_locations(num_loc_left - 1)
  end

  def insert_fake_location do
    # TODO
    Repo.insert! %Location{
      lat: Faker.float,
      lon: Faker.float,
      label: Faker.string,
      unit: Faker.string,
      address: Faker.string,
      city: Faker.string,
      region: Faker.string,
      country: Faker.string,
      location_type: LocationType.home
    }
  end
end
