defmodule Teenager do
  def hey(input) do
    input = String.strip(input)
    cond do
      String.length(input) == 0 ->
        "Fine. Be that way!"
      String.ends_with?(input, "?") ->
        "Sure."
      input == String.upcase(input) && !Regex.match?(~r/^[0-9\s,]*$/, input) ->
        "Whoa, chill out!"
      true ->
        "Whatever."
    end
  end
end
