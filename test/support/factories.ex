defmodule PhoenixBlog.Factories do
  use ExMachina.Ecto, repo: PhoenixBlog.Repo

  def user_factory do
    %PhoenixBlog.Accounts.User {
      username: "Joe",
      uuid: "XYZ"
    }
  end
end
