defmodule PhoenixBlogWeb.PostControllerTest do
  use PhoenixBlogWeb.ConnCase

  import PhoenixBlog.Factory

  @create_attrs %{title: "a title", story: "a story"}
  # @update_attrs %{username: "some updated username", uuid: "some updated uuid"}
  @invalid_attrs %{title: nil, story: nil, user_id: nil}

  describe "index" do
    test "lists all posts", %{conn: conn} do
      conn = get conn, post_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Posts"
    end
  end

  describe "new post" do
    test "renders form", %{conn: conn} do
      conn = get conn, post_path(conn, :new)
      assert html_response(conn, 200) =~ "New Post"
    end
  end

  describe "create post" do
    test "redirects to show when data is valid", %{conn: conn} do
      user = insert(:user)
      create_attrs = Map.put(@create_attrs, :user_id, user.id)

      conn = post conn, post_path(conn, :create), post: create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == post_path(conn, :show, id)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, post_path(conn, :create), post: @invalid_attrs
      assert html_response(conn, 200) =~ "New Post"
    end
  end

  describe "show post" do
    test "renders the details of a post", %{conn: conn} do
      post = insert(:post)
      conn = get conn, post_path(conn, :show, post.id)
      assert html_response(conn, 200) =~ "Show Post"
    end
  end

  describe "edit post" do
    test "renders form for editing chosen user", %{conn: conn} do
      post = insert(:post)
      conn = get conn, post_path(conn, :edit, post)
      assert html_response(conn, 200) =~ "Edit Post"
    end
  end

  # describe "update user" do
  #   setup [:create_user]
  #
  #   test "redirects when data is valid", %{conn: conn, user: user} do
  #     conn = put conn, user_path(conn, :update, user), user: @update_attrs
  #     assert redirected_to(conn) == user_path(conn, :show, user)
  #
  #     conn = get conn, user_path(conn, :show, user)
  #     assert html_response(conn, 200) =~ "some updated username"
  #   end
  #
  #   test "renders errors when data is invalid", %{conn: conn, user: user} do
  #     conn = put conn, user_path(conn, :update, user), user: @invalid_attrs
  #     assert html_response(conn, 200) =~ "Edit User"
  #   end
  # end
  #
  # describe "delete user" do
  #   setup [:create_user]
  #
  #   test "deletes chosen user", %{conn: conn, user: user} do
  #     conn = delete conn, user_path(conn, :delete, user)
  #     assert redirected_to(conn) == user_path(conn, :index)
  #     assert_error_sent 404, fn ->
  #       get conn, user_path(conn, :show, user)
  #     end
  #   end
  # end
  #
  # defp create_user(_), do: {:ok, user: insert(:user)}
end
