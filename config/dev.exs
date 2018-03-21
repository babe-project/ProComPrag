use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :procomprag, ProComPrag.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
                    cd: Path.expand("../", __DIR__)]]


# Watch static and templates for browser reloading.
config :procomprag, ProComPrag.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# These are only the default values for use with the local, offline deployment with Docker.
config :procomprag, ProComPrag.Repo,
       adapter: Ecto.Adapters.Postgres,
       username: "procomprag_dev",
       password: "procomprag",
       # Used for Docker deployment
       hostname: "db",
       # Used for running it directly in command line with native Elixir installation.
       # I should probably create a Docker-only environment name. Let me do it later then.
       # hostname: "localhost",
       database: "procomprag_dev",
       pool_size: 10

config :procomprag, :environment, :dev

# See https://github.com/phoenixframework/phoenix/issues/1199. Seems that it suffices in most cases to keep the passwords in this file.
# import_config "dev.secret.exs"

