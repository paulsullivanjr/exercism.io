defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string_list = String.split(string, [" ", "-", "," ])

    for word <- string_list do
       Regex.split(~r/[A-Z]{1}[a-z]+/, word, include_captures: true)
    end
    |> List.flatten
    |> Enum.filter(&(&1 != ""))
    |> Enum.map(&String.first(String.upcase(&1)))
    |> List.to_string
  end
end
