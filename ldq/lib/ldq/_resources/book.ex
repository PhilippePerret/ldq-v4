defmodule LdQ.Book do
  @moduledoc """
  Le module pour gérer les livres.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "books" do
    field :title, :string
    field :year, :integer
    field :isbn, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :isbn, :year])
    |> validate_required([:title])
  end


  alias LdQ.Repo
  alias LdQ.Book

  @doc """
  Returns the list of books.

  ## Examples

      iex> list_books()
      [%__MODULE__{}, ...]

  """
  def list_books do
    Repo.all(Book)
  end

  @doc """
  Gets a single book.

  Raises `Ecto.NoResultsError` if the Book does not exist.

  ## Examples

      iex> get_book!(123)
      %__MODULE__{}

      iex> get_book!(456)
      ** (Ecto.NoResultsError)

  """
  def get_book!(id), do: Repo.get!(Book, id)

  @doc """
  Creates a book.

  ## Examples

      iex> create_book(%{field: value})
      {:ok, %__MODULE__{}}

      iex> create_book(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_book(attrs \\ %{}) do
    %__MODULE__{}
    |> Book.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a book.

  ## Examples

      iex> update_book(book, %{field: new_value})
      {:ok, %__MODULE__{}}

      iex> update_book(book, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_book(%__MODULE__{} = book, attrs) do
    book
    |> Book.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a book.

  ## Examples

      iex> delete_book(book)
      {:ok, %__MODULE__{}}

      iex> delete_book(book)
      {:error, %Ecto.Changeset{}}

  """
  def delete_book(%__MODULE__{} = book) do
    Repo.delete(book)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking book changes.

  ## Examples

      iex> change_book(book)
      %Ecto.Changeset{data: %__MODULE__{}}

  """
  def change_book(%__MODULE__{} = book, attrs \\ %{}) do
    Book.changeset(book, attrs)
  end



end #/module LdQ.Book
