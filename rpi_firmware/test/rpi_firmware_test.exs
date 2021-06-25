defmodule RpiFirmwareTest do
  use ExUnit.Case
  doctest RpiFirmware

  test "greets the world" do
    assert RpiFirmware.hello() == :world
  end
end
