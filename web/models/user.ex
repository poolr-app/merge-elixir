defmodule MergeApi.User do
  use MergeApi.Web, :model
  alias MergeApi.Enums.Permissions

  schema "users" do
    field :perm_level, Permissions, default: Permissions.user
    field :phone_number, :string
    field :email, :string
    field :auth_token, :string
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
    |> cast(params, [:is_admin, :phone_number, :email, :auth_token, :signup_date, :last_active, :photo_url])
    |> validate_required([:is_admin, :phone_number, :email, :signup_date, :last_active])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:phone_number)
  end
  

end
