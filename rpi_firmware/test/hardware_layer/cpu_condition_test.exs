defmodule CpuConditionTest do
  use ExUnit.Case, async: true

  import Mox

  setup :verify_on_exit!

  test "cpu tempreture/0 returns result" do
    CpuConditionMock
    |> expect(:cpu_temp, fn -> {:ok, "20"} end)

    assert CpuCondition.cpu_temp() == "20"

  end
end
