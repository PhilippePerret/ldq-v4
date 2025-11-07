defmodule Utils.FilesTest do
  use ExUnit.Case 

  describe "la fonction older?" do
    test "classe bien deux fichiers" do
      file1 = "test/assets/files/older_older.md"
      file2 = "test/assets/files/older_younger.md"
      assert(true == Utils.Files.older?(file1, file2), "la comparaison de date devrait fonctionner")
    end
  end

end