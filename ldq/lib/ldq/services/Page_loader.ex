defmodule LdQ.PageLoader do

  def load(relpath, lang) do
    fpath = "#{Application.get_env(:ldq, :data_path)}/textes/#{lang}/#{relpath}"
    # IO.puts "Fpath = #{fpath}"
    File.read!(fpath)
  end

end