defmodule Ring do
  @interval 2000
  # 2 seconds

  @name :ticker

  def start do
    first_client = spawn(__MODULE__, :client, [])
    send first_client, { :tick }
    doorman = spawn(__MODULE__, :wait_for_joiners, [first_client])
    :global.register_name(@name, doorman)
  end

  def join do
    spawn(__MODULE__, :wait_for_welcome, [])
  end

  def wait_for_joiners(first) do
    receive do
      { :join, pid } ->
        IO.puts "Request to join from: #{inspect pid}"
        send first, {:please_welcome, pid}
        wait_for_joiners(first)
    end
  end

  def wait_for_welcome do
    send :global.whereis_name(@name), { :join, self() }
    receive do
      {:welcome, next} ->
        client(next)
    end
  end

  def client(next \\ self(), ticking \\ false) do
    receive do
      { :please_welcome, pid } ->
        send pid, {:welcome, next}
        client(pid, ticking)
      { :tick } ->
        IO.puts("Got tick: #{inspect self()}")
        client(next, true)
    after
      @interval ->
        case ticking do
          true ->
            send next, {:tick}
          _ ->  :noop
        end
        client(next, next == self())
    end
  end

end

