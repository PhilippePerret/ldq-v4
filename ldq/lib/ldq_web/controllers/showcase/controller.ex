defmodule LdQWeb.ShowcaseController do
  use LdQWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: {LdQWeb.Layouts, :showcase})
  end

  def shower(conn, %{"page_id" => page_id} = _params) do
    IO.puts "Page à voir: #{inspect page_id}"
    content = LdQ.PageLoader.load("#{page_id}.html", "fr")
    IO.puts "content = #{inspect content}"
    render(conn, :shower, %{
      layout: {LdQWeb.Layouts, :showcase},
      page_id: page_id,
      content: content
    })
  end


end