defmodule MergeApi.Repo.Migrations.CreateUser do
  use Ecto.Migration
  alias MergeApi.Enums.Permissions

  def change do
    create table(:users) do
      add :perm_level, Permissions, default: Permissions.user
      add :phone_number, :string
      add :email, :string
      add :auth_token, :string
      add :signup_date, :utc_datetime
      add :last_active, :utc_datetime
      add :photo_url, :string

      timestamps()
    end

  end
end
