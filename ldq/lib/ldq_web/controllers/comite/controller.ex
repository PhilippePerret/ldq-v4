defmodule LdQWeb.ComiteController do
  use LdQWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: {LdQWeb.Layouts, :comite})
  end

  def submit_candidature(conn, _params) do
    render(conn, :candidature_submission, layout: {LdQWeb.Layouts, :comite})
  end

  def aide(conn, params) do
    render(conn, :help, %{help_id: params["file"]})
  end

end