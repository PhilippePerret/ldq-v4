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
    belongs_to :books, LdQ.Book
  end

  @doc false
  def changeset(b_card, attrs) do
    b_card
    |> cast(attrs, [:readings])
  end

  alias LdQ.Library.BCard
  alias LdQ.Repo

  @doc """
  Returns the list of book_cards.

  ## Examples

      iex> list_book_cards()
      [%__MODULE__{}, ...]

  """
  def list_book_cards do
    Repo.all(BCard)
  end

  @doc """
  Gets a single b_card.

  Raises `Ecto.NoResultsError` if the B card does not exist.

  ## Examples

      iex> get_b_card!(123)
      %__MODULE__{}

      iex> get_b_card!(456)
      ** (Ecto.NoResultsError)

  """
  def get_b_card!(id), do: Repo.get!(BCard, id)

  @doc """
  Creates a b_card.

  ## Examples

      iex> create_b_card(%{field: value})
      {:ok, %__MODULE__{}}

      iex> create_b_card(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_b_card(attrs \\ %{}) do
    %__MODULE__{}
    |> BCard.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a b_card.

  ## Examples

      iex> update_b_card(b_card, %{field: new_value})
      {:ok, %__MODULE__{}}

      iex> update_b_card(b_card, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_b_card(%__MODULE__{} = b_card, attrs) do
    b_card
    |> BCard.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a b_card.

  ## Examples

      iex> delete_b_card(b_card)
      {:ok, %__MODULE__{}}

      iex> delete_b_card(b_card)
      {:error, %Ecto.Changeset{}}

  """
  def delete_b_card(%__MODULE__{} = b_card) do
    Repo.delete(b_card)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking b_card changes.

  ## Examples

      iex> change_b_card(b_card)
      %Ecto.Changeset{data: %__MODULE__{}}

  """
  def change_b_card(%__MODULE__{} = b_card, attrs \\ %{}) do
    BCard.changeset(b_card, attrs)
  end


end #/module LdQ.Library.BCard
