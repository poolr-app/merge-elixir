defmodule MergeApi.SessionController do
  @moduledoc
  # The SessionController manages login via tokens
  use MergeApi.Web, :controller
  alias MergeApi.User
  alias MergeApi.UserQuery
  alias MergeApi.Services.TwoFactor

  def create_session(conn, params = %{sfa_token: token}) do
    # called on /auth route to add a token to the user
    # check 2fa value
    case TwoFactor.check_token(token) do
      # the value is correct, generate token.
      {:ok, user } -> 
        # TODO: Add perms value per user perms
        Guardian.Plug.sign_in(conn, user, :access, key: :auth_token)
      # the value is incorrect, fail
      {:error, user } -> user
  end

  def delete_session(conn, param = %User{}) do
    # called on /deauth to revoke a token for a user
  end

  def unauthenticated(conn, _params) do
    # handler called when no session token found
  end

  def unauthorized(conn, _params) do
    # handler called when incorrect token found
  end
end
