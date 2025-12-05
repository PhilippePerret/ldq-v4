defmodule LdQ.PageLoader do

  def load(relpath, lang) do
    fpath = "#{Application.get_env(:ldq, :data_path)}/textes/#{lang}/#{relpath}"
    # IO.puts "Fpath = #{fpath}"
    str = File.read!(fpath)
    str = Regex.replace(~r/\[icon\:(.+?)\]/, str, fn tout, found -> LdQ.Icone.get(found) end)

    # |> Regex.replace(~r/\[icon\:(.+?)\]/, fn _tout, found -> LdQ.Icone.get(String.to_atom(found)) end)
  end

end