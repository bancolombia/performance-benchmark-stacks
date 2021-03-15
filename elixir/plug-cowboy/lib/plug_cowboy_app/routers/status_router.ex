defmodule PlugCowboyApp.Routers.StatusRouter do
  alias PlugCowboyApp.Models.Status
  use Plug.Router

  plug(:match)
  plug(:dispatch)


  get "/status" do
    status = Poison.encode!(Status.up())
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, status)
  end

  match _ do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(404, "{\"error\":\"Not Found\"}")
  end

end
