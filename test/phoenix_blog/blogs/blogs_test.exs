defmodule PhoenixBlog.BlogsTest do
  use PhoenixBlog.DataCase

  alias PhoenixBlog.Accounts

  alias PhoenixBlog.Blogs

  describe "post" do
    alias PhoenixBlog.Blogs.Post

    @valid_attrs %{story: "some story", title: "some title"}
    @update_attrs %{story: "some updated story", title: "some updated title"}
    @invalid_attrs %{story: nil, title: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} = Accounts.create_user(attrs)

      user
    end

    def post_fixture(attrs \\ %{}) do
      user = user_fixture(%{username: "some username", uuid: "some uuid"})

      {:ok, post} =
        attrs
        |> Enum.into(Map.put(@valid_attrs, :user_id, user.id))
        |> Blogs.create_post()

      post
    end

    test "list_post/0 returns all post" do
      post = post_fixture()
      assert Blogs.list_post() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Blogs.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      user = user_fixture(%{username: "some username", uuid: "some uuid"})

      assert {:ok, %Post{} = post} = Blogs.create_post(Map.put(@valid_attrs, :user_id, user.id))
      assert post.story == "some story"
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blogs.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, post} = Blogs.update_post(post, @update_attrs)
      assert %Post{} = post
      assert post.story == "some updated story"
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Blogs.update_post(post, @invalid_attrs)
      assert post == Blogs.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Blogs.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Blogs.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Blogs.change_post(post)
    end
  end
end
