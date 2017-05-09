defmodule MergeApi.SessionController do
  @moduledoc
  # The SessionController manages login via tokens
  use MergeApi.Web, :controller
  alias MergeApi.User
  alias MergeApi.UserQuery
  alias MergeApi.Services.TwoFactor

  def create_session(conn, params = %{user: user, two_factor_token: token}) do
    # called on /auth route to add a token to the user
    # check 2fa value
    case TwoFactor.check_token(user, token) do
      # the value is correct, generate token.
      {:ok, user } -> 
        # TODO: Add perms value per user perms
        Guardian.Plug.sign_in(conn, user, :access, key: :auth_token)
        Repo.get(user, :auth_token)
      # the value is incorrect, fail
      {:error, message } -> 
        auth_error_response(conn, message)
    end
  end

  def unauthenticated(conn, _params) do
    # handler called when no session token found
    auth_error_response(conn, "Unauthorised Access")
  end

  def unauthorized(conn, _params) do
    # handler called when incorrect token found
    auth_error_response(conn, "Unauthorised Access")
  end

  defp auth_error_response(conn, message) do
    conn 
    |> put_status(:authentication_error)
    |> render("error.json", message)

end
