alias PhoenixBlog.Repo

alias PhoenixBlog.Accounts.User
alias PhoenixBlog.Blogs.Post

# Clean

Repo.delete_all User
Repo.delete_all Post

# Insert users

Repo.insert! %User{
  username: "joebew42",
  uuid: "xyz"
}
