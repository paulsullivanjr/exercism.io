defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """

  @spec encode(String.t) :: String.t
  def encode(string) do
    String.graphemes(string)
    |> Enum.chunk_by(fn arg -> arg end)
    |> Enum.flat_map(fn(x) -> [Integer.to_string(length(x)), List.first(x)] end)
    |> Enum.join
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    chunked_list = 
      String.graphemes(string)
      |> Enum.chunk_by(fn x -> validate_number(x) end) 
      |> Enum.chunk(2)
    for c <- chunked_list, into: "", do: create_string(Enum.at(c, 0), Enum.at(c, 1))
  end

  defp create_string(num, letter) do
    number = create_integer(num)
    String.duplicate(Enum.at(letter, 0), number)
  end

  defp create_integer(num) do
    num |> Enum.join |> String.to_integer
  end

  def validate_number(x) do
    case Integer.parse(x) do
      {n, _} ->
        true
       _ ->
        false
      end
  end
end
