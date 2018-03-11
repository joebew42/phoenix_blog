defmodule PhoenixBlogWeb.PostController do
  use PhoenixBlogWeb, :controller

  alias PhoenixBlog.Accounts

  alias PhoenixBlog.Blogs
  alias PhoenixBlog.Blogs.Post

  def index(conn, _params) do
    posts = Blogs.list_post()
    render(conn, "index.html", posts: posts)
  end

  def new(conn, _params) do
    changeset = Blogs.change_post(%Post{})
    all_users = Accounts.list_users
    render(conn, "new.html", changeset: changeset, all_users: all_users)
  end

  def create(conn, %{"post" => post_params}) do
    case Blogs.create_post(post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: post_path(conn, :show, post))
      {:error, %Ecto.Changeset{} = changeset} ->
        all_users = Accounts.list_users
        render(conn, "new.html", changeset: changeset, all_users: all_users)
    end
  end

  def show(conn, %{"id" => id}) do
    post = Blogs.get_post!(id)
    render(conn, "show.html", post: post)
  end

  def edit(conn, %{"id" => id}) do
    post = Blogs.get_post!(id)
    changeset = Blogs.change_post(post)
    all_users = Accounts.list_users
    render(conn, "edit.html", post: post, changeset: changeset, all_users: all_users)
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Blogs.get_post!(id)

    case Blogs.update_post(post, post_params) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Post updated successfully.")
        |> redirect(to: post_path(conn, :show, post))
      {:error, %Ecto.Changeset{} = changeset} ->
        all_users = Accounts.list_users
        render(conn, "edit.html", post: post, changeset: changeset, all_users: all_users)
    end
  end
  #
  # def delete(conn, %{"id" => id}) do
  #   user = Accounts.get_user!(id)
  #   {:ok, _user} = Accounts.delete_user(user)
  #
  #   conn
  #   |> put_flash(:info, "User deleted successfully.")
  #   |> redirect(to: user_path(conn, :index))
  # end
end
