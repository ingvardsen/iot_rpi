# https://medium.com/flatiron-labs/elixir-test-mocking-with-mox-b825a955143f
# https://pre.hn/elixir-tests-with-mox-patterns/
# https://elixirschool.com/en/lessons/libraries/mox/

# https://dev.to/nickforall/debugging-and-mocking-third-party-services-in-elixir-with-mox-3gfb
# test objects https://blog.lelonek.me/how-to-mock-httpoison-in-elixir-7947917a9266



defmodule CpuConditionBehaviour do
  @callback cpu_temp() :: map
end

defmodule CpuCondition do
  defdelegate cpu_temp(), to: RpiFirmware.Application.cpucondition_adapter()
end

defmodule CpuConditionLive do
  @behaviour CpuConditionBehaviour

  def cpu_temp() do
    {:ok, "20"}
  end
end
