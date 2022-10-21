defmodule RulesTest do
  use ExUnit.Case

  alias IslandsEngine.Rules

  describe "Testing state machine" do
    test "Moving from initialised to add player" do
      rules = Rules.new()
      {:ok, rules} = Rules.check(rules, :add_player) |> dbg

      assert rules.state == :players_set
    end

    test "Moving to an invalid state" do
      rules = Rules.new()
      res = Rules.check(rules, :none_state)
      assert res == :error
      assert rules.state == :initialized
    end
  end

end
