defmodule PhoenixBlog.Blogs.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhoenixBlog.Accounts.User

  schema "post" do
    field :story, :string
    field :title, :string
    belongs_to :user, User

    timestamps(inserted_at: :published_at)
  end

  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :story, :user_id])
    |> validate_required([:title, :story, :user_id])
    |> assoc_constraint(:user)
  end
end
