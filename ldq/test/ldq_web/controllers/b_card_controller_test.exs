defmodule LdQWeb.BCardControllerTest do
  use LdQWeb.ConnCase

  import LdQ.LibraryFixtures

  @create_attrs %{readings: 42}
  @update_attrs %{readings: 43}
  @invalid_attrs %{readings: nil}

  describe "index" do
    test "lists all book_cards", %{conn: conn} do
      conn = get(conn, ~p"/book_cards")
      assert html_response(conn, 200) =~ "Listing Book cards"
    end
  end

  describe "new b_card" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/book_cards/new")
      assert html_response(conn, 200) =~ "New B card"
    end
  end

  describe "create b_card" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/book_cards", b_card: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/book_cards/#{id}"

      conn = get(conn, ~p"/book_cards/#{id}")
      assert html_response(conn, 200) =~ "B card #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/book_cards", b_card: @invalid_attrs)
      assert html_response(conn, 200) =~ "New B card"
    end
  end

  describe "edit b_card" do
    setup [:create_b_card]

    test "renders form for editing chosen b_card", %{conn: conn, b_card: b_card} do
      conn = get(conn, ~p"/book_cards/#{b_card}/edit")
      assert html_response(conn, 200) =~ "Edit B card"
    end
  end

  describe "update b_card" do
    setup [:create_b_card]

    test "redirects when data is valid", %{conn: conn, b_card: b_card} do
      conn = put(conn, ~p"/book_cards/#{b_card}", b_card: @update_attrs)
      assert redirected_to(conn) == ~p"/book_cards/#{b_card}"

      conn = get(conn, ~p"/book_cards/#{b_card}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, b_card: b_card} do
      conn = put(conn, ~p"/book_cards/#{b_card}", b_card: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit B card"
    end
  end

  describe "delete b_card" do
    setup [:create_b_card]

    test "deletes chosen b_card", %{conn: conn, b_card: b_card} do
      conn = delete(conn, ~p"/book_cards/#{b_card}")
      assert redirected_to(conn) == ~p"/book_cards"

      assert_error_sent 404, fn ->
        get(conn, ~p"/book_cards/#{b_card}")
      end
    end
  end

  defp create_b_card(_) do
    b_card = b_card_fixture()
    %{b_card: b_card}
  end
end
