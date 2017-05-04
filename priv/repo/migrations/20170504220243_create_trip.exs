defmodule MergeApi.Repo.Migrations.CreateTrip do
  use Ecto.Migration

  def change do
    create table(:trips) do
      add :start_datetime, :utc_datetime
      add :arrival_datetime, :utc_datetime
      add :owning_user, :integer
      add :start_location, :integer
      add :end_location, :integer

      timestamps()
    end

  end
end
