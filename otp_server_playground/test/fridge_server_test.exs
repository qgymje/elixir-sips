defmodule FridgeServerTest do
  use ExUnit.Case

  test "puttting something into the fridge" do
    {:ok,fridge} = FridgeServer.start_link []
    assert :ok == FridgeServer.store fridge,:bacon
  end

  test "removing something from the fridge" do
    {:ok,fridge} = FridgeServer.start_link []
    :ok = FridgeServer.store fridge,:bacon
    assert {:ok, :bacon} == FridgeServer.take fridge,:bacon
  end

  test "taking somehting from the fridge that isn't in there" do
    {:ok,fridge} = FridgeServer.start_link []
    assert :not_found == FridgeServer.take fridge,:bacon
  end
end
