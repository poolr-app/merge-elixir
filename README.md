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
  * To get a specific user:
  ` curl -H "Content-Type: application/json" -X GET  http://localhost:4000/api/users/$id` where $id is replaced by the id you are looking for
  * To post into the db use something like:
      `curl -H "Content-Type: application/json" -X POST -d '{"user":{"is_admin":"false", "phone_number": "1(234) 567-8910", "email":"bobby@bobbysplace.com", "password_hash":"thisistotallyasecurehash", "auth_token_string":"totallyasecureauthtoken", "signup_date":"2017-03-29T03:45:43", "last_active":"2017-04-29T20:30:34"}}' http://localhost:4000/api/users`
      - This will send back the complete user with it's id field.


## Misc Commands
  * To see all available mix commands `mix help`
  * Interactive Elixir Prompt: `iex`
  * See all routes: `mix phoenix.routes`

## Routes So far:
    page_path  GET     /                   MergeApi.PageController :index
 session_path  POST    /api/auth           MergeApi.SessionController :create_session
    user_path  GET     /api/users          MergeApi.UserController :index
    user_path  GET     /api/users/:id      MergeApi.UserController :show
    user_path  POST    /api/users          MergeApi.UserController :create
    user_path  PATCH   /api/users/:id      MergeApi.UserController :update
               PUT     /api/users/:id      MergeApi.UserController :update
    user_path  DELETE  /api/users/:id      MergeApi.UserController :delete
location_path  GET     /api/locations      MergeApi.LocationController :index
location_path  GET     /api/locations/:id  MergeApi.LocationController :show
location_path  POST    /api/locations      MergeApi.LocationController :create
location_path  PATCH   /api/locations/:id  MergeApi.LocationController :update
               PUT     /api/locations/:id  MergeApi.LocationController :update
location_path  DELETE  /api/locations/:id  MergeApi.LocationController :delete
    trip_path  GET     /api/trips          MergeApi.TripController :index
    trip_path  GET     /api/trips/:id      MergeApi.TripController :show
    trip_path  POST    /api/trips          MergeApi.TripController :create
    trip_path  PATCH   /api/trips/:id      MergeApi.TripController :update
               PUT     /api/trips/:id      MergeApi.TripController :update
    trip_path  DELETE  /api/trips/:id      MergeApi.TripController :delete
matching_path  POST    /api/match          MergeApi.MergeApi.Services.Matching :match
