defmodule CpuConditionTest do
  use ExUnit.Case, async: true

  import Mox

  setup :verify_on_exit!

  test "cpu tempreture/0 returns a text string" do
    CpuConditionMock
    |> expect(:cpu_temp fn -> "20" end)

    assert "20" = CpuCondition.cpu_temp()

  end
end
