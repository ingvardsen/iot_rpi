# https://github.com/supersimple/drizzle/blob/master/lib/drizzle/scheduler.ex

defmodule RpiFirmware.Cputemp do
  use GenServer
  require Logger

  def start_link(_args) do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do

    Logger.info("Starting scheduler")

    schedule_work()
    {:ok, state}
  end

  def handle_info(:work, state) do

    read_temp()

    # todo fire phoenix event

    schedule_work()
    {:noreply, state}
  end

  defp schedule_work() do

    Process.send_after(self(), :work, 2000)

  end

  def read_temp() do

    {temp, _} = System.cmd("vcgencmd", ["measure_temp"])
    Logger.info(temp)

  end
end
