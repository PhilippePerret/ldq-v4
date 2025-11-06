defmodule LdQ.LibraryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LdQ.Library` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        isbn: "some isbn",
        title: "some title",
        year: 42
      })
      |> LdQ.Library.create_book()

    book
  end

  @doc """
  Generate a b_card.
  """
  def b_card_fixture(attrs \\ %{}) do
    {:ok, b_card} =
      attrs
      |> Enum.into(%{
        readings: 42
      })
      |> LdQ.Library.create_b_card()

    b_card
  end
end
