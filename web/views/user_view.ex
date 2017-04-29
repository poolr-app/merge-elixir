defmodule MergeApi.UserView do
  use MergeApi.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, MergeApi.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, MergeApi.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      is_admin: user.is_admin,
      phone_number: user.phone_number,
      email: user.email,
      password_hash: user.password_hash,
      auth_token_string: user.auth_token_string,
      signup_date: user.signup_date,
      last_active: user.last_active,
      photo_url: user.photo_url}
  end
end
