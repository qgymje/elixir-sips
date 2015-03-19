defmodule PongTest do
  use ExUnit.Case

  test "it responseds to a ping with a pong" do
    pong = spawn_link(Pong, :start, [])
    send(pong,{:ping,self})
    assert_receive {:pong,pong}
  end
end
