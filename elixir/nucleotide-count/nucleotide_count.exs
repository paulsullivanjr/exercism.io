defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    validate(nucleotide)
    histogram(strand)
    |> Map.get(nucleotide)
  end

  def count(_strand, _nucleotide) do
    raise ArgumentError
  end

  @spec histogram([char]) :: map
  def histogram(strand) do
    Enum.reduce strand, nucleotide_map, fn(letter, acc) -> 
      validate(letter)
      Map.update(acc, letter, 0, &(&1 + 1))
    end
  end

  defp nucleotide_map do
    for x <- @nucleotides, into: %{}, do: {x, 0}
  end

  defp validate(nucleotide) do
    unless nucleotide in @nucleotides, do: raise ArgumentError, "Invalid nucleotide!"
  end
end
