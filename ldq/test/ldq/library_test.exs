defmodule LdQ.LibraryTest do
  use LdQ.DataCase

  alias LdQ.Library

  describe "books" do
    alias LdQ.Library.Book

    import LdQ.LibraryFixtures

    @invalid_attrs %{title: nil, year: nil, isbn: nil}

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Library.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Library.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      valid_attrs = %{title: "some title", year: 42, isbn: "some isbn"}

      assert {:ok, %Book{} = book} = Library.create_book(valid_attrs)
      assert book.title == "some title"
      assert book.year == 42
      assert book.isbn == "some isbn"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      update_attrs = %{title: "some updated title", year: 43, isbn: "some updated isbn"}

      assert {:ok, %Book{} = book} = Library.update_book(book, update_attrs)
      assert book.title == "some updated title"
      assert book.year == 43
      assert book.isbn == "some updated isbn"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_book(book, @invalid_attrs)
      assert book == Library.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Library.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Library.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Library.change_book(book)
    end
  end
end
