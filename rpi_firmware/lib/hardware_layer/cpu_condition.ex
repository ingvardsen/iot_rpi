# https://medium.com/flatiron-labs/elixir-test-mocking-with-mox-b825a955143f
# https://pre.hn/elixir-tests-with-mox-patterns/
# https://elixirschool.com/en/lessons/libraries/mox/

# https://dev.to/nickforall/debugging-and-mocking-third-party-services-in-elixir-with-mox-3gfb
# Test objects https://blog.lelonek.me/how-to-mock-httpoison-in-elixir-7947917a9266
# Hal in eink  https://underjord.io/an-eink-display-with-nerves-elixir.html


defmodule CpuConditionBehaviour do
  @callback cpu_temp() :: {:ok, String}
end


defmodule CpuCondition do
  defdelegate cpu_temp, to: RpiFirmware.Application.cpu_condition_adapter()
end


defmodule CpuConditionImplementation do

  require Logger

  def cpu_temp_degrees() do

    {:ok, temp} = CpuCondition.cpu_temp()

    parsed = temp
    |> String.to_charlist()
    |> Enum.filter( fn a -> a > 47 && a < 58 end )
    |> List.to_string

    Logger.info("temp: #{temp}, parsed: #{parsed}")

    {:ok, parsed}

  end
end


defmodule CpuConditionLive do
  @behaviour CpuConditionBehaviour

  require Logger

  def cpu_temp() do

    {temp, _} = System.cmd("vcgencmd", ["measure_temp"])

    Logger.info("measure_temp, #{temp}")

    {:ok, temp}
  end
end
