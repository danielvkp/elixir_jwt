defmodule VlogWeb.PageController do
  use VlogWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
