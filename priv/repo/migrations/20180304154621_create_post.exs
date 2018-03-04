defmodule PhoenixBlog.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:post) do
      add :title, :string, null: false
      add :story, :text, null: false
      add :user_id, references(:users, on_delete: :delete_all, null: false)

      timestamps(inserted_at: :published_at)
    end

    create index(:post, [:user_id])
  end
end
