defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """


  @spec convert(pos_integer) :: String.t
  def convert(number) do
    message = divide_three(number) <> divide_five(number) <> divide_seven(number)
    if message != "", do: message, else: to_string(number)
  end

  defp divide_three(number) do
    if rem(number, 3) == 0, do: "Pling", else: ""
  end
  defp divide_five(number) do
    if rem(number, 5) == 0, do: "Plang", else: ""
  end
  defp divide_seven(number) do
    if rem(number, 7) == 0, do: "Plong", else: ""
  end
end
