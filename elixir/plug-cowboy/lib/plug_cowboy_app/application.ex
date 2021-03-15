defmodule PlugCowboyApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  alias PlugCowboyApp.Routers.StatusRouter
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: StatusRouter,
        options: [
          port: 8080
        ]
      )
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PlugCowboyApp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
