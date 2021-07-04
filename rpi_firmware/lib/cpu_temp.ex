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

    {:ok, temp} = read_temp()

    Logger.info("handle_info #{temp}")

    # Fire phoenix event
    Phoenix.PubSub.broadcast(RpiUi.PubSub, "cputemp", temp)

    schedule_work()
    {:noreply, state}
  end

  defp schedule_work() do

    Process.send_after(self(), :work, 2000)

  end

  # Abstract away, and add volts, underpower state ...
  # https://www.raspberrypi.org/documentation/raspbian/applications/vcgencmd.md
  defp read_temp() do

    {temp, _} = System.cmd("vcgencmd", ["measure_temp"])

    {:ok, temp}
  end
end
