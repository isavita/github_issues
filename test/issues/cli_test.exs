defmodule Issues.CLITest do
  use ExUnit.Case
  doctest Issues.CLI

  import Issues.CLI, only: [parse_args: 1]

  describe "CLI.parse_args/1" do
    test "returns :help when option parsing with -h and --help options" do
      assert parse_args(["-h", "anything"]) == :help
      assert parse_args(["--help", "anything"]) == :help
    end

    test "returns three values if three values given" do
      assert parse_args(["user", "project", "10"]) == {"user", "project", 10}
    end


    test "returns default issues count if two values given" do
      assert parse_args(["user", "project"]) == {"user", "project", 4}
    end
  end
end
