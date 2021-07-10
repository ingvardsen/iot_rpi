defmodule CpuConditionTest do

  use ExUnit.Case, async: true

  import Mox

  setup :verify_on_exit!

  test "cpu temp returns a number" do
    CpuConditionMock
    |> expect(:cpu_temp, fn -> {:ok, "temp=46.7'C"} end)

    assert {:ok, "46.7"} == CpuConditionImplementation.cpu_temp_degrees()
  end

end
