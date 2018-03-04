defmodule PhoenixBlog.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhoenixBlog.Blogs.Post

  schema "users" do
    field :username, :string
    field :uuid, :string
    has_many :post, Post

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:uuid, :username])
    |> validate_required([:uuid, :username])
    |> unique_constraint(:uuid)
    |> unique_constraint(:username)
  end
end
