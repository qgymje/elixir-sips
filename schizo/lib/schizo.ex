defmodule Schizo do
  def uppercase(word) do
    words = String.split(word)
    transform(words,[], &String.upcase/1)
  end

  def unvowel(word) do
    words = String.split(word)
    transform(
      words,
      [],
      fn word ->
        Regex.replace(~r/[aeiou]/,word,"")
      end
    )
  end

  defp transform([head|tail], result, handle_fun) do
    count = Enum.count(result)

    handled_head = case rem count,2 do
      0 -> head
      1 -> handle_fun.(head)
    end

   transform(tail, result ++ handled_head, handle_fun)
  end

  defp transform([],result, _) do
    Enum.join(Enum.reverse(result)," ")
  end

end
