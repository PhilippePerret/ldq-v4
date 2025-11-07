defmodule LdQWeb.ShowcaseController do
  use LdQWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end

  def shower(conn, %{"page_id" => page_id} = _params) do
    IO.puts "Page à voir: #{inspect page_id}"
    render(conn, :shower, %{page_id: page_id})
  end


end