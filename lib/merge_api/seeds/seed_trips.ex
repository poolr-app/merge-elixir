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

  # def insert_fake_user do
  #   Repo.insert! %User{
  #     is_admin: false,
  #     phone_number: Faker.Phone.EnUs.phone(),
  #     email: Faker.Internet.email,
  #     password_hash: "hash_todo",
  #     auth_token_string: "token_todo",
  #     signup_date: Faker.NaiveDateTime.backward(30) |> to_ecto_datetime,
  #     last_active: Faker.NaiveDateTime.backward(2) |> to_ecto_datetime,
  #     photo_url: Faker.Avatar.image_url()
  #   }
  # end
end
