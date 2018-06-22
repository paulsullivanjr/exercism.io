defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a == b        -> :equal
      process(a, b) -> :superlist
      process(b, a) -> :sublist
      true          -> :unequal
    end
  end

  defp process(_, []), do: true
  defp process([], _), do: false
  defp process(partial_list = [head | tail], full_list) do
    if head === hd(full_list) && Enum.slice(partial_list, 0, Enum.count(full_list)) == full_list do
      true
    else
      process(tail, full_list)
    end
  end
end
