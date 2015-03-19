defmodule FridgeServer do
  use GenServer

  ### public api
  def start_link([]) do
    :gen_server.start_link FridgeServer,[],[]
  end

  def store(fridge,item) do
    :gen_server.call(fridge,{:store, item})
  end

  def take(fridge,item)do
    :gen_server.call(fridge, {:take, item})
  end


  ### GenServer api
  def init(items) do
    {:ok, items}
  end

  def handle_call({:store, item}, _from, items) do
    IO.inspect [item | items]
    {:reply, :ok, [item | items]}
    #{:reply, :ok, items ++ item}
  end

  def handle_call({:take, item}, _from, items) do
    #found = Enum.find(items, :not_found, fn(x) -> x == item end)
    #case found do
      #:not_found -> {:reply, :not_found, items}
       #         _-> {:reply, {:ok, item}, List.delete(items,item)}
    #end

    case Enum.member?(items,item) do
      true -> {:reply, {:ok, item}, List.delete(items, item)}
      false -> {:reply, :not_found, items}
    end
  end


end
