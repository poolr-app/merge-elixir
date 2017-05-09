defmodule MergeApi.Trip do
  use MergeApi.Web, :model
  alias MergeApi.Enums.MatchingState

  schema "trips" do
    field :start_datetime, Ecto.DateTime
    field :arrival_datetime, Ecto.DateTime
    field :owning_user, :integer
    field :start_location, :integer
    field :end_location, :integer
    field :state, :integer, default: MatchingState.unmatched

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:start_datetime, :arrival_datetime, :owning_user, :start_location, :end_location])
    |> validate_required([:start_datetime, :arrival_datetime, :owning_user, :start_location, :end_location])
  end
end
