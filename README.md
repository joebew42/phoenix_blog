# PhoenixBlog

A playground application written in Elixir/Phoenix. This is the place where to try all the stuffs related to the web application development with Elixir/Phoenix (e.g. Channels, OTP, Background jobs, ReactJS, Semantic-UI, GraphQL API or Restful API and whatever you'd like to try).

## Requirements

* npm (ver. 5.7.1 or above)
* elixir (ver. 1.6.1 or above)
* postgresql (ver. 9.3 or above)

## Setup

Build the [Semantic UI](https://semantic-ui.com/) library

```
cd assets/
npm install && npm run build_assets
```

Fetch all dependencies

```
mix deps.get
```

You need a PostgreSQL instance running. You can run it quickly with Docker:

```
docker run -it --rm=true --name postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 postgres:alpine
```

Create the database and run all migrations

```
mix ecto.create && mix ecto.migrate
```

Run the _seeds_ if you want to populate the database

```
mix run priv/repo/seeds.exs
```

You're done with the setup!

## Run

```
mix phx.server
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Test

```
mix test
```

# Change the Semantic UI theme

If you want to try different Semantic UI theme:

1) go to the folder `assets/vendor/semantic/`

2) open the file `src/theme.config`

3) change the theme (e.g. from `amazon` to `github`)

4) rebuild the theme with `gulp build`

5) rebuild the `priv/static/` assets. Go to the folder `assets/` and execute `npm run build_assets`

# Scratchpad

## DOING

- Edit an existing post

## TODO

- What to do when the post we want to edit does not exists?
