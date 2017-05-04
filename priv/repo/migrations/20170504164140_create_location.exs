defmodule MergeApi.Repo.Migrations.CreateLocation do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :lat, :float
      add :lon, :float
      add :label, :string
      add :unit, :string
      add :address, :string
      add :city, :string
      add :region, :string
      add :country, :string
      add :location_type, :string

      timestamps()
    end

  end
end
