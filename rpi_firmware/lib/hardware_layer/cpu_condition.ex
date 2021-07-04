# https://medium.com/flatiron-labs/elixir-test-mocking-with-mox-b825a955143f
# https://pre.hn/elixir-tests-with-mox-patterns/
# https://elixirschool.com/en/lessons/libraries/mox/

defmodule CpuConditionBehaviour do
  @callback cpu_temp() :: map
end

defmodule CpuCondition do
  @behaviour CpuConditionBehaviour

  def cpu_temp() do
    {:ok, "20"}
  end
end

defmodule CpuConditionLive do
  @behaviour CpuConditionBehaviour

  def cpu_temp() do
    {:ok, "20"}
  end
end
