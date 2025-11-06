defmodule LdQ.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :isbn, :string
      add :year, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
