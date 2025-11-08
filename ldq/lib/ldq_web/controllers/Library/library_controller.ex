defmodule LdQWeb.LibraryController do
  use LdQWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: {LdQWeb.Layouts, :library} )
  end
end