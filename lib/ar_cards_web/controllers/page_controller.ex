defmodule ArCardsWeb.PageController do
  use ArCardsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
