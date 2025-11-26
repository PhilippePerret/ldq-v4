defmodule LdQ.PageLoader do

  def load(relpath, lang) do
    fpath = "#{Application.get_env(:mon_app, :data_path)}/textes/#{lang}/#{relpath}"
    # IO.puts "Fpath = #{fpath}"
    File.read!(fpath)
  end

end