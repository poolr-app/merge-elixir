defmodule MergeApi.Services.TwoFactor do
  alias MergeApi.User

  def check_token(token) do
    if token == "12345" do
      {ok:, Repo.get(User
  end
end
