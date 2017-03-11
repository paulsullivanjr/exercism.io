defmodule DNA do
  @nucleotides [?A, ?T, ?C, ?G]

  def count(strand, from_user) do
    validate(from_user)

    Enum.count(strand, fn(from_strand)-> valid_and_match?(from_strand, from_user) end)
  end

  def histogram(strand) do
    map = %{?A => 0, ?T => 0, ?C => 0, ?G => 0, }
    strand
    |> histogram(map)
  end
  def histogram([head | tail], map) do
    validate(head)
    map = %{map | head => map[head] + 1 }

    histogram(tail, map)
  end
  def histogram([], map), do: map

  defp valid_and_match?(nucleotide1, nucleotide2) do
    validate(nucleotide1)

    nucleotide1 == nucleotide2
  end

  defp validate(nucleotide) do
    unless nucleotide in @nucleotides, do: raise ArgumentError, "Invalid nucleotide"
  end
end