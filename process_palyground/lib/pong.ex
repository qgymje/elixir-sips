defmodule Pong do

  def start do
    loop(0)
  end

  def loop(count) do
    receive do
      {:ping, from} -> send(from,{:pong, self})
    end
    IO.puts "received ping #{count + 1} times"
    loop(count + 1)
  end
end
