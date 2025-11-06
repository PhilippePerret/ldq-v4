defmodule LdQ.Library.BCard do
  @moduledoc """
  Module pour gérer les cartes de livre dans la bibliothèque.
  Ne pas les confondre avec les BCard des comités de lecture, qui
  porte le même nom.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "book_cards" do
    field :readings, :integer


    timestamps(type: :utc_datetime)
    belongs_to :books, LdQ.Library.Book
  end

  @doc false
  def changeset(b_card, attrs) do
    b_card
    |> cast(attrs, [:readings])
  end
end
