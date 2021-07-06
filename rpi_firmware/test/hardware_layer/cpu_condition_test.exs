defmodule CpuConditionTest do

  use ExUnit.Case, async: true
  import Mox

  setup :verify_on_exit!

  test "cpu temp returns a number" do
    CpuConditionMock
    |> expect(:cpu_temp, fn -> {:ok, "2000"} end)

    assert {:ok, "20"} == CpuConditionLive.cpu_temp(:data)
  end

end
