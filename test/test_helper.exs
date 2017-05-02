ExUnit.start

Ecto.Adapters.SQL.Sandbox.mode(MergeApi.Repo, :manual)

defmodule Forge do
  use Blacksmith

  register :user,
    is_admin: false,
    phone_number: Faker.Phone.EnUs.phone(),
    email: Sequence.next(:email, &"test#{&1}@testexample.com")
    password_hash: :string,
    auth_token_string: :string,
    signup_date: Faker.DateTime.backwards(30),
    last_active: Faker.DateTime.backwards(2),
    photo_url: Faker.Avatar.image_url()

  register :admin,
    is_admin: true,
    phone_number: Faker.Phone.EnUs.phone(),
    email: Sequence.next(:email, &"test#{&1}@testexample.com")
    password_hash: :string,
    auth_token_string: :string,
    signup_date: Faker.DateTime.backwards(30),
    last_active: Faker.DateTime.backwards(2),
    photo_url: Faker.Avatar.image_url()
end
   

