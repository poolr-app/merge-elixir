defmodule MergeApi.Location do
  use MergeApi.Web, :model

  schema "locations" do
    field :lat, :float
    field :lon, :float
    field :label, :string
    field :unit, :string
    field :address, :string
    field :city, :string
    field :region, :string
    field :country, :string
    field :location_type, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:lat, :lon, :label, :unit, :address, :city, :region, :country, :location_type])
    |> validate_required([:lat, :lon, :label, :unit, :address, :city, :region, :country, :location_type])
  end
end
