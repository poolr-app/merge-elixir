defmodule MergeApi.Seeds.SeedUsers do
  alias MergeApi.User
  alias MergeApi.Repo

  def insert_many_fake_users(num_users_left \\ 250) do
    insert_fake_user
    insert_many_fake_users(num_users_left - 1)
  end

  def insert_fake_user do
    Repo.insert! %User{
      is_admin: false,
      phone_number: Faker.Phone.EnUs.phone(),
      email: Faker.Internet.email,
      password_hash: "hash_todo",
      auth_token_string: "token_todo",
      signup_date: Faker.NaiveDateTime.backward(30) |> to_ecto_datetime,
      last_active: Faker.NaiveDateTime.backward(2) |> to_ecto_datetime,
      photo_url: Faker.Avatar.image_url()
    }
  end
  
  def insert_fake_admin do
    Repo.insert! %User{
      is_admin: true,
      phone_number: Faker.Phone.EnUs.phone(),
      email: Faker.Internet.email,
      password_hash: "hash_todo",
      auth_token_string: "token_todo",
      signup_date: Faker.NaiveDateTime.backward(30) |> to_ecto_datetime,
      last_active: Faker.NaiveDateTime.backward(2) |> to_ecto_datetime,
      photo_url: Faker.Avatar.image_url()
    }
  end

  defp to_ecto_datetime(naiveDateTime) do
    naiveDateTime |> NaiveDateTime.to_erl |> Ecto.DateTime.from_erl
  end
end
