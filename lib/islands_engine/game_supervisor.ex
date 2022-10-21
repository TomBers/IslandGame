#---
# Excerpted from "Functional Web Development with Elixir, OTP, and Phoenix",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/lhelph for more book information.
#---
defmodule IslandsEngine.GameSupervisor do
  use Supervisor

  alias IslandsEngine.Game

  def start_link(_options), do:
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)

  def start_game(name), do:
    Supervisor.start_child(__MODULE__, [name])

  def stop_game(name) do
    :ets.delete(:game_state, name)
    Supervisor.terminate_child(__MODULE__, pid_from_name(name))
  end

  def init(:ok), do:
    Supervisor.init([Game], strategy: :simple_one_for_one)

  defp pid_from_name(name) do
    name
    |> Game.via_tuple()
    |> GenServer.whereis()
  end
end
