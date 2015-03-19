defmodule Ping do

  def start do
    loop
  end

  def loop do
    receive do
      {:pong, from} -> send(from,{:ping, self})
    end
    loop
  end
end
