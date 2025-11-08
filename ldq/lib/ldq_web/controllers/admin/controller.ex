defmodule LdQWeb.AdminController do
  use LdQWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: {LdQWeb.Layouts, :admin})
  end

end