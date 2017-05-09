defmodule MergeApi.Services.Matching do
  alias MergeApi.Repo
  alias MergeApi.Enums.MatchingState
  def match(conn, %{"user" => user, "user_id" => user_id}) do
    # TODO
    user = Repo.get(user, user_id)
    trip = Repo.get(user, :trip) #where it is the first trip where matchingstate == unmatched
    Repo.set(trip, :state, MatchingState.matching)
    case find_match(trip) do
      {:ok, match} -> 
        # matched correctly
        Repo.set(trip, :state, MatchingState.matched)
        trip
      {:error, message} ->
        Repo.set(trip, :state, MatchingState.unmatched)
        message
    end
  end

  defp find_match(trip) do
    # TODO
    {:error, "Couldn't find match"}
  end
end
