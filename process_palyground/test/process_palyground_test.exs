defmodule ProcessPalygroundTest do
  use ExUnit.Case

  test "it ping pong once" do
    ping = spawn_link(Ping, :start, [])
    pong = spawn_link(Pong, :start, [])

    send(ping, {:pong, pong})
    send(pong, {:ping, ping})
  end
end
