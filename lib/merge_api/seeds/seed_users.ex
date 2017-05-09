defmodule MergeApi.Seeds.SeedUsers do
  alias MergeApi.User
  alias MergeApi.Repo
  alias MergeApi.Enums.PermissionLevel

  def insert_many_fake_users(num_users_left \\ 250) do
    insert_fake_user
    insert_many_fake_users(num_users_left - 1)
  end

  def insert_fake_user do
    Repo.insert! %User{
      perm_level: PermissionLevel.user,
      phone_number: Faker.Phone.EnUs.phone(),
      email: Faker.Internet.email,
      auth_token: "token_todo",
      signup_date: Faker.NaiveDateTime.backward(30) |> to_ecto_datetime,
      last_active: Faker.NaiveDateTime.backward(2) |> to_ecto_datetime,
      photo_url: Faker.Avatar.image_url()
    }
  end
  
  def insert_fake_admin do
    Repo.insert! %User{
      perm_level: PermissionLevel.admin,
      phone_number: Faker.Phone.EnUs.phone(),
      email: Faker.Internet.email,
      auth_token: "12345",
      signup_date: Faker.NaiveDateTime.backward(30) |> to_ecto_datetime,
      last_active: Faker.NaiveDateTime.backward(2) |> to_ecto_datetime,
      photo_url: Faker.Avatar.image_url()
    }
  end

  defp to_ecto_datetime(naiveDateTime) do
    naiveDateTime |> NaiveDateTime.to_erl |> Ecto.DateTime.from_erl
  end
end
