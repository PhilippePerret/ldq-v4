defmodule LdQ.Library do
  @moduledoc """
  The Library context.
  """

  import Ecto.Query, warn: false
  alias LdQ.Repo

  alias LdQ.Library.Book

  @doc """
  Returns the list of books.

  ## Examples

      iex> list_books()
      [%Book{}, ...]

  """
  def list_books do
    Repo.all(Book)
  end

  @doc """
  Gets a single book.

  Raises `Ecto.NoResultsError` if the Book does not exist.

  ## Examples

      iex> get_book!(123)
      %Book{}

      iex> get_book!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book!(id), do: Repo.get!(Book, id)

  @doc """
  Creates a book.

  ## Examples

      iex> create_book(%{field: value})
      {:ok, %Book{}}

      iex> create_book(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book(attrs \\ %{}) do
    %Book{}
    |> Book.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book.

  ## Examples

      iex> update_book(book, %{field: new_value})
      {:ok, %Book{}}

      iex> update_book(book, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book(%Book{} = book, attrs) do
    book
    |> Book.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a book.

  ## Examples

      iex> delete_book(book)
      {:ok, %Book{}}

      iex> delete_book(book)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book(%Book{} = book) do
    Repo.delete(book)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book changes.

  ## Examples

      iex> change_book(book)
      %Ecto.Changeset{data: %Book{}}

  """
  def change_book(%Book{} = book, attrs \\ %{}) do
    Book.changeset(book, attrs)
  end

  alias LdQ.Library.BCard

  @doc """
  Returns the list of book_cards.

  ## Examples

      iex> list_book_cards()
      [%BCard{}, ...]

  """
  def list_book_cards do
    Repo.all(BCard)
  end

  @doc """
  Gets a single b_card.

  Raises `Ecto.NoResultsError` if the B card does not exist.

  ## Examples

      iex> get_b_card!(123)
      %BCard{}

      iex> get_b_card!(456)
      ** (Ecto.NoResultsError)

  """
  def get_b_card!(id), do: Repo.get!(BCard, id)

  @doc """
  Creates a b_card.

  ## Examples

      iex> create_b_card(%{field: value})
      {:ok, %BCard{}}

      iex> create_b_card(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_b_card(attrs \\ %{}) do
    %BCard{}
    |> BCard.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a b_card.

  ## Examples

      iex> update_b_card(b_card, %{field: new_value})
      {:ok, %BCard{}}

      iex> update_b_card(b_card, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_b_card(%BCard{} = b_card, attrs) do
    b_card
    |> BCard.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a b_card.

  ## Examples

      iex> delete_b_card(b_card)
      {:ok, %BCard{}}

      iex> delete_b_card(b_card)
      {:error, %Ecto.Changeset{}}

  """
  def delete_b_card(%BCard{} = b_card) do
    Repo.delete(b_card)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking b_card changes.

  ## Examples

      iex> change_b_card(b_card)
      %Ecto.Changeset{data: %BCard{}}

  """
  def change_b_card(%BCard{} = b_card, attrs \\ %{}) do
    BCard.changeset(b_card, attrs)
  end
end
