defmodule LdQ.Repo.Migrations.CreateBookCards do
  use Ecto.Migration

  def change do
    create table(:book_cards, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :readings, :integer
      add :book_id, references(:books, on_delete: :delete_all, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:book_cards, [:book_id])
  end
end
