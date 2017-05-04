# MergeApi

## Setup

  * Install dependencies with `mix deps.get`
  * Ensure Postgres is started
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Seed the server with `mix run priv/repo/seeds.exs`

## Development
  * Start the Phoenix endpoint with `mix phoenix.server`
  * Navigate to `localhost:4000/api/users` to see the users you just seeded. 
  * To post into the db use something like:
      `curl -H "Content-Type: application/json" -X POST -d '{"user":{"is_admin":"false", "phone_number": "1(234) 567-8910", "email":"bobby@bobbysplace.com", "password_hash":"thisistotallyasecurehash", "auth_token_string":"totallyasecureauthtoken", "signup_date":"2017-03-29T03:45:43", "last_active":"2017-04-29T20:30:34"}}' http://localhost:4000/api/users`


## Misc Commands
  * To see all available mix commands `mix help`
  * Interactive Elixir Prompt: `iex`
  * See all routes: `mix phoenix.routes`


