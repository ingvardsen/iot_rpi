# Rpi Firmware

Investigating Nerves on a RPI3. No USB 

TODO 
  * Read temp and present - 1. log it with scheduler
    * Make tests
      * mock for UI dev, and unit test


```sh
export MIX_TARGET=rpi3
export MIX_ENV=dev
export NERVES_NETWORK_SSID=your_wifi_name
export NERVES_NETWORK_PSK=your_wifi_password

# shutting down
Nerves.Runtime.halt()
Nerves.Runtime.revert
```


Links
  * [Runtime](https://hexdocs.pm/nerves_runtime/readme.html#device-reboot-and-shutdown)
  * [PWM / pigpio](https://dev.to/mnishiguchi/elixir-nerves-pulse-width-modulation-pwm-for-led-mj2)
  * [Provisioning](https://embedded-elixir.com/post/2018-06-15-serial_number/)
  * [Circuits](https://elixir-circuits.github.io)
  * [Pigpio, Phoenix, GenServer](https://tomhaines.uk/blog/simple-iot-with-elixir/)
  * [ULN2003](https://www.peterullrich.com/rotate-a-flag-with-nerves)  
  * [Sonos volume](https://dockyard.com/blog/2020/09/08/creating-a-sonos-volumeknob-with-elixir-the-beam-and-liveview)  


More links
  * [i2c](https://blog.mnishiguchi.com/iot-development-using-raspberry-pi-elixir-and-nerves)
  * [QT kiosk](https://elixirforum.com/t/usb-touch-screen-with-nerves-kiosk/29996)
  * [DS18B20](https://github.com/developerworks/hello_celsius_sensor/blob/master/lib/hello_celsius.ex)
  * [Birdhouse](https://dasky.xyz/posts/2020/08/12/an-iot-birdhouse-with-elixir-nerves-phoenix-liveview-components/)
  * [Debugging remote](https://mfeckie.github.io/Remote-Profiling-Elixir-Over-SSH/)



## Targets -- initiating project

Nerves applications produce images for hardware targets based on the
`MIX_TARGET` environment variable. If `MIX_TARGET` is unset, `mix` builds an
image that runs on the host (e.g., your laptop). This is useful for executing
logic tests, running utilities, and debugging. Other targets are represented by
a short name like `rpi3` that maps to a Nerves system image for that platform.
All of this logic is in the generated `mix.exs` and may be customized. For more
information about targets see:

https://hexdocs.pm/nerves/targets.html#content

## Getting Started

To start your Nerves app:
  * `export MIX_TARGET=my_target` or prefix every command with
    `MIX_TARGET=my_target`. For example, `MIX_TARGET=rpi3`
  * Install dependencies with `mix deps.get`
  * Create firmware with `mix firmware`
  * Burn to an SD card with `mix firmware.burn`

## Learn more

  * Official docs: https://hexdocs.pm/nerves/getting-started.html
  * Official website: https://nerves-project.org/
  * Forum: https://elixirforum.com/c/nerves-forum
  * Discussion Slack elixir-lang #nerves ([Invite](https://elixir-slackin.herokuapp.com/))
  * Source: https://github.com/nerves-project/nerves
