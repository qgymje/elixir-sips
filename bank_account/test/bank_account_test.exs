defmodule BankAccountTest do
  use ExUnit.Case

  test "starts off with a balance of 0" do
    account = spawn_link(BankAccount, :start, [[]])
    verify_balance_is 0, account
  end

  test "add 10" do
    account = spawn_link(BankAccount, :start, [[]])
    send(account, {:deposit, 10})
    verify_balance_is(10, account)
  end

  test "add 10 then minus 20" do
    account = spawn_link(BankAccount, :start, [[]])
    send(account, {:deposit, 10})
    send(account, {:decrease, 20})
    verify_balance_is(-10, account)
  end

  def verify_balance_is(expected_balance, account) do
    send(account, {:check_balance, self})
    assert_receive {:balance, ^expected_balance}
  end
end
