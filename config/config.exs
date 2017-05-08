# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :merge_api,
  ecto_repos: [MergeApi.Repo]

# Configures the endpoint
config :merge_api, MergeApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Q4rVksyH5tqKmA4eyzu87LBWyNz5w5E00koWebMcBet/VTYVpVrAEelKVbS3tcQ/",
  render_errors: [view: MergeApi.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MergeApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "MyApp",
  ttl: { 30, :days },
  allowed_drift: 2000,
  verify_issuer: true, # optional
  secret_key: "SUPERSECRETKEY",
  serializer: MyApp.GuardianSerializer
