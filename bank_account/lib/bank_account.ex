defmodule BankAccount do
  def start([]) do
    await([])
  end

  def await(events) do
    receive do
      {:check_balance, from} -> divulge_balance(from, events)
      {:deposit, ammount} -> events = deposit(events, ammount)
      {:decrease, ammount} -> events = decrease(events, ammount)
    end
    await(events)
  end

  defp divulge_balance(from,events) do
    send(from , {:balance, calculate_balance(events)})
  end

  defp deposit(events, ammount) do
    events ++ [{:deposit, ammount}]
  end

  defp decrease(event, ammount) do
    event ++ [{:decrease,ammount}]
  end

  defp calculate_balance(events) do
    deposit = sum(just_deposit(events))
    decrease = sum(just_decrease(events))

    deposit - decrease
  end

  defp just_deposit(events) do
    just_type(events,:deposit)
  end

  defp just_decrease(events) do
    just_type(events, :decrease)
  end

  defp just_type(events,expected_type) do
    Enum.filter(events, fn({type,_}) -> type == expected_type end)
  end

  defp sum(events) do
    Enum.reduce(events, 0, fn({_, ammount}, acc) -> acc + ammount end)
  end
end
