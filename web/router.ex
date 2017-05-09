defmodule MergeApi.Router do
  use MergeApi.Web, :router
  import MergeApi.Services

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Guaridan.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource
    plug Guardian.Plug.EnsureAuthenticated, handler: MergeApi.SessionController
  end

  scope "/", MergeApi do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", MergeApi do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/locations", LocationController, except: [:new, :edit]
    resources "/trips", TripController, except: [:new, :edit]
    post "/match", Matching, :match
    post "/auth", SessionController, :create
  end
end
