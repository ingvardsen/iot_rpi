defmodule RpiFirmware.CpuCondition do
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

    {:ok, temp} = CpuConditionImplementation.cpu_temp_degrees()

    Logger.info("server handle_info #{temp}")

    # Fire phoenix event
    Phoenix.PubSub.broadcast(RpiUi.PubSub, "cputemp", temp)

    schedule_work()
    {:noreply, state}
  end

  defp schedule_work() do

    Process.send_after(self(), :work, 2000)

  end

end
