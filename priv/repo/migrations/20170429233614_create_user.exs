defmodule MergeApi.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :is_admin, :boolean, default: false, null: false
      add :phone_number, :string
      add :email, :string
      add :password_hash, :string
      add :auth_token_string, :string
      add :signup_date, :utc_datetime
      add :last_active, :utc_datetime
      add :photo_url, :string

      timestamps()
    end

  end
end
