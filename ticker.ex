defmodule Ticker do
  @interval 2000
  # 2 seconds

  @name :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [[]])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send :global.whereis_name(@name), { :register, client_pid }
  end

  def generator(clients) do
    receive do
      { :register, pid } ->
        IO.puts "registering #{inspect pid}"
        generator([pid|clients])
    after
      @interval ->
        IO.puts "tick"
        case clients do
            [] ->
              IO.puts "no customers"
              generator(clients)
            _ ->
              send List.last(clients), { :tick }
              generator([List.last(clients) | List.delete_at(clients, -1)])
        end

    end
  end

end

defmodule Client do
  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Ticker.register(pid)
  end

  def receiver do
    receive do
      { :tick } ->
        IO.puts "tock in client"
        receiver
    end
  end
end