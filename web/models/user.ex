defmodule MergeApi.User do
  use MergeApi.Web, :model

  schema "users" do
    field :is_admin, :boolean, default: false
    field :phone_number, :string
    field :email, :string
    field :password, :string virtual: true
    field :password_hash, :string
    field :auth_token_string, :string
    field :signup_date, Ecto.DateTime
    field :last_active, Ecto.DateTime
    field :photo_url, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:is_admin, :phone_number, :email, :password_hash, :auth_token_string, :signup_date, :last_active, :photo_url])
    |> validate_required([:is_admin, :phone_number, :email, :password_hash, :signup_date, :last_active])
  end
end
