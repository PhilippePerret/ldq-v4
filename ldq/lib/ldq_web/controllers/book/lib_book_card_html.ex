defmodule LdQWeb.BCardHTML do
  use LdQWeb, :html

  embed_templates "lib_book_card_html/*"

  @doc """
  Renders a b_card form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def b_card_form(assigns)
end
