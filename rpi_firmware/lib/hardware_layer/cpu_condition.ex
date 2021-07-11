
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
    |> Enum.filter( fn a -> (a > 47 && a < 58) || a == 46 end )
    |> List.to_string

    Logger.info("temp: #{temp}, parsed: #{parsed}")

    {:ok, parsed}

  end
end


defmodule CpuConditionLive do
  @behaviour CpuConditionBehaviour

  def cpu_temp() do

    {temp, _} = System.cmd("vcgencmd", ["measure_temp"])

    {:ok, temp}

  end
end
