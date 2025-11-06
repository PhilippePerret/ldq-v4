defmodule LdQWeb.BCardController do
  use LdQWeb, :controller

  alias LdQ.Library
  alias LdQ.Library.BCard

  def index(conn, _params) do
    book_cards = Library.list_book_cards()
    render(conn, :index, book_cards: book_cards)
  end

  def new(conn, _params) do
    changeset = Library.change_b_card(%BCard{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"b_card" => b_card_params}) do
    case Library.create_b_card(b_card_params) do
      {:ok, b_card} ->
        conn
        |> put_flash(:info, "B card created successfully.")
        |> redirect(to: ~p"/book_cards/#{b_card}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    b_card = Library.get_b_card!(id)
    render(conn, :show, b_card: b_card)
  end

  def edit(conn, %{"id" => id}) do
    b_card = Library.get_b_card!(id)
    changeset = Library.change_b_card(b_card)
    render(conn, :edit, b_card: b_card, changeset: changeset)
  end

  def update(conn, %{"id" => id, "b_card" => b_card_params}) do
    b_card = Library.get_b_card!(id)

    case Library.update_b_card(b_card, b_card_params) do
      {:ok, b_card} ->
        conn
        |> put_flash(:info, "B card updated successfully.")
        |> redirect(to: ~p"/book_cards/#{b_card}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, b_card: b_card, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    b_card = Library.get_b_card!(id)
    {:ok, _b_card} = Library.delete_b_card(b_card)

    conn
    |> put_flash(:info, "B card deleted successfully.")
    |> redirect(to: ~p"/book_cards")
  end
end
