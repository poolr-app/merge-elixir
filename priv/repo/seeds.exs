# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MergeApi.Repo.insert!(%MergeApi.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias MergeApi.Seeds.SeedUsers
alias MergeApi.Seeds.SeedLocations
alias MergeApi.Seeds.SeedTrips

SeedUsers.insert_fake_admin
SeedUsers.insert_many_fake_users(25)
SeedLocations.insert_many_fake_locations(50)
SeedTrips.insert_fake_user_trips_for_locations
