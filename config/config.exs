# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :vlog,
  ecto_repos: [Vlog.Repo]

# Configures the endpoint
config :vlog, VlogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VEpX46bjjBu+jAjZ1aVQTgK6bzUhmEShgG3q20bap3HcSbqt2w0EXXhaXCjLdCBJ",
  render_errors: [view: VlogWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Vlog.PubSub, adapter: Phoenix.PubSub.PG2]

  config :vlog, Vlog.Guardian,
    issuer: "vlog",
    secret_key: "EuBjJCflv1S0MUp1ZEy5SaltUZ5BTKww4v51J3gtjFreWje34HfVovYTVWvMZE7A"


# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
