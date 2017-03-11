defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    String.replace(sentence, "_", " ")
    |> String.replace(~r/[^a-zA-Z0-9\x{00C0}-\x{00FF} -]/u, "")
    |> String.downcase()
    |> String.split()
    |> Enum.reduce( %{}, &update_count/2)
  end

  def update_count(word, acc) do
    Map.update acc, word, 1, &(&1 + 1)
  end
end
