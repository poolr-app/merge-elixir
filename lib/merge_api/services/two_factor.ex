defmodule MergeApi.Services.TwoFactor do
  alias MergeApi.User

  def check_token(user, token) do
    case token do
      "12345" -> 
        {:ok, Repo.get(user, :id)}
      _ -> {:error, "Could not authenticate token"}
    end
  end
end
