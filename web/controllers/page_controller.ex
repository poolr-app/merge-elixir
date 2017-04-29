defmodule MergeApi.PageController do
  use MergeApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
