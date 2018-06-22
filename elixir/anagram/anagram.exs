defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.filter(candidates, fn(word) -> String.length(base) == String.length(word) end)
    |> Enum.filter(fn(word) -> anagram?(base, word)  end)
  end

  def anagram?(base, candidate) when is_binary(base) and is_binary(candidate) do
    String.downcase(base) != String.downcase(candidate) && sort_string(base) == sort_string(candidate)
  end

  def sort_string(string) do
    string
    |> String.downcase()
    |> String.graphemes()
    |> Enum.sort()
  end
end
