defmodule PhoenixBlog.Factory do
  use ExMachina.Ecto, repo: PhoenixBlog.Repo

  def user_factory do
    %PhoenixBlog.Accounts.User {
      username: "Joe",
      uuid: "XYZ"
    }
  end

  def post_factory do
    %PhoenixBlog.Blogs.Post {
      title: "A title",
      story: "A story",
      user: build(:user)
    }
  end
end
