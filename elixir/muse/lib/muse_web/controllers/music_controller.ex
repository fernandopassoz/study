defmodule MuseWeb.MusicController do
  use MuseWeb, :controller

  alias Muse.Music

  def index(conn, _params) do
    "ok"
    |> Music.create()
    |> handle_response(conn)
  end

  defp handle_response({:ok, music}, conn) do
    conn
    |> put_status(200)
    # |> put_resp_header("Header test", "OK!!!")
    # |> json()
    |> render("create.json", music: music)
  end

  defp handle_response({:error, message}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(%{message: message})
  end
end
