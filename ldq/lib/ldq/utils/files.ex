defmodule Utils.Files do
  @moduledoc """
  Module de méthode utilitaires pour les fichiers
  """

  @doc """
  Fonction qui retourne True quand le premier fichier est plus vieux
  que le deuxième fichier.
  """
  def older?(path1, path2) when is_binary(path1) and is_binary(path2) do
    time_file1 = File.lstat!(path1).mtime |> NaiveDateTime.from_erl!
    time_file2 = File.lstat!(path2).mtime |> NaiveDateTime.from_erl!
    NaiveDateTime.before?(time_file1, time_file2)
  end

end