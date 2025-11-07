defmodule LdQWeb.ComiteController do
  use LdQWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end

end