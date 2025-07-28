defmodule Ashie.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AshieWeb.Telemetry,
      Ashie.Repo,
      {DNSCluster, query: Application.get_env(:ashie, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Ashie.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Ashie.Finch},
      # Start a worker by calling: Ashie.Worker.start_link(arg)
      # {Ashie.Worker, arg},
      # Start to serve requests, typically the last entry
      AshieWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ashie.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AshieWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
