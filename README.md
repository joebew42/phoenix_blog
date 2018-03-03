# PhoenixBlog

## Requirements

* npm
* elixir
* postgresql

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
