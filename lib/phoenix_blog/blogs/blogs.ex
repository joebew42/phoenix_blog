defmodule PhoenixBlog.Blogs do
  import Ecto.Query, warn: false
  alias PhoenixBlog.Repo

  alias PhoenixBlog.Blogs.Post

  def list_post do
    Repo.all(Post)
    |> Repo.preload([:user])
  end

  def get_post!(id) do
    Repo.get!(Post, id)
    |> Repo.preload([:user])
  end

  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  def change_post(%Post{} = post) do
    Post.changeset(post, %{})
  end
end
