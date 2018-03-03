defmodule PhoenixBlog.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :uuid, :string
      add :username, :string

      timestamps()
    end

    create unique_index(:users, [:uuid])
    create unique_index(:users, [:username])
  end
end
