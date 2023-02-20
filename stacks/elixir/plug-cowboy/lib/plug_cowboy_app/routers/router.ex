defmodule PlugCowboyApp.Routers.StatusRouter do
  alias Controllers.StatusController
  alias Controllers.HashController
  alias Controllers.CryptController
  alias Controllers.PrimeController
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/status" do
    StatusController.status()
    |> send_result(conn)
  end

  get "/hash" do
    conn
    |> handle_loop_status(&HashController.hash/2)
  end

  get "/crypt" do
    conn
    |> handle_loop_status(&CryptController.hash/2)
  end

  get "/prime/:top" do
    top = parse_int(conn.path_params["top"], 100)
    conn
    |> handle_loop_status(fn (percentage, delay) -> PrimeController.primes(percentage, delay, top) end)
  end

  defp handle_loop_status(conn, fun) do
    params = conn
             |> fetch_query_params()
    percentage = get_query_int(params.query_params, "percentage", 100)
    delay = get_query_int(params.query_params, "delay", 0)
    fun.(percentage, delay)
    |> send_result(conn)
  end

  defp get_query_int(query_params, param, default) do
    parse_int(query_params[param], default)
  end

  defp parse_int(nil, default), do: default
  defp parse_int(value, default) do
    case Integer.parse(value) do
      {num, _} -> num
      _ -> default
    end
  end

  defp send_result(result, conn) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(result))
  end

  match _ do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(404, "{\"error\":\"Not Found\"}")
  end

end
