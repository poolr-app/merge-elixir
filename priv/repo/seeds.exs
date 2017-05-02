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

alias MergeApi.Seeds

Seeds.insert_fake_admin
Seeds.insert_fake_user
Seeds.insert_fake_user
Seeds.insert_fake_user
