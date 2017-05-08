defmodule MergeApi.Serializers.GuardianSerializer do
  @moduledoc
  # This module seralizes the token generated by guardian
  @behaviour Guardian.Serializer

  alias MergeApi.Repo
  alias MergeApi.User

  def for_token(user = %User{}), do: {:ok, "User:#{user.id}"}
  def for_token(_), do: {:error, "Unknown resource type"}

  def for_token("User" <> id), do: {:ok, Repo.get(User. id)}
  def for_token(_), do: {:error, "Unknown resource type"}
end