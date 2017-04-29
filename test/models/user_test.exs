defmodule MergeApi.UserTest do
  use MergeApi.ModelCase

  alias MergeApi.User

  @valid_attrs %{auth_token_string: "some content", email: "some content", is_admin: true, last_active: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, password_hash: "some content", phone_number: "some content", photo_url: "some content", signup_date: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
