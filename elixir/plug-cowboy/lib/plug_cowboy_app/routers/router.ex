defmodule PlugCowboyApp.Routers.StatusRouter do
  alias Controllers.StatusController
  alias Controllers.HashController
  alias Controllers.CryptController
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

  defp handle_loop_status(conn, fun) do
    params = conn
             |> fetch_query_params()
    percentage = get_query_int(params.query_params, "percentage")
    delay = get_query_int(params.query_params, "delay")
    fun.(percentage, delay)
    |> send_result(conn)
  end

  defp get_query_int(query_params, param) do
    parse_int(query_params[param])
  end

  defp parse_int(nil), do: 100
  defp parse_int(value) do
    case Integer.parse(value) do
      {num, _} -> num
      _ -> 100
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
