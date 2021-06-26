defmodule RpiFirmware.Cputemp do
  use GenServer
  require Logger

  def loop_forever() do
    read_temp()

    # TODO add mock and HAL
    Process.sleep(1000)
    loop_forever()
  end

  def read_temp() do

    l = System.cmd("vcgencmd", ["measure_temp"])
    Logger.info(l)

  end
end
