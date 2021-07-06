# https://medium.com/flatiron-labs/elixir-test-mocking-with-mox-b825a955143f
# https://pre.hn/elixir-tests-with-mox-patterns/
# https://elixirschool.com/en/lessons/libraries/mox/

# https://dev.to/nickforall/debugging-and-mocking-third-party-services-in-elixir-with-mox-3gfb
# Test objects https://blog.lelonek.me/how-to-mock-httpoison-in-elixir-7947917a9266
# Hal in eink  https://underjord.io/an-eink-display-with-nerves-elixir.html


defmodule CpuConditionBehaviour do
  @callback cpu_temp() :: {:ok, String}
end

#defmodule CpuCondition do
#  IO.puts("Env: #{Application.get_env(:hardware_layer, :cpu_condition)}")
#  defdelegate cpu_temp, to: Application.get_env(:hardware_layer, :cpu_condition)
#end

defmodule CpuConditionLive do
  @behaviour CpuConditionBehaviour

  def cpu_temp(:data) do
    cpu_temp()
  end

  def cpu_temp() do
    # {temp, _} = System.cmd("vcgencmd", ["measure_temp"])
    {:ok, "temp"}
  end

end
