# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
import Config


# When we deploy to a device, we use the "prod" configuration:
import_config "../../rpi_ui/config/config.exs"
import_config "../../rpi_ui/config/prod.exs"

config :rpi_ui, RpiUiWeb.Endpoint,
  # Nerves root filesystem is read-only, so disable the code reloader
  code_reloader: false,
  http: [port: 80],
  # Use compile-time Mix config instead of runtime environment variables
  load_from_system_env: false,
  # Start the server since we're running in a release instead of through `mix`
  server: true,
  # Cookie secret
  secret_key_base: "WFzVZOVRiUo1Vz++K3C7gMJ8lGTUMEwF8sCJi1KOjZqPnQlFTN1yFFmkRgmBK1PV",
  url: [host: "nerves.local", port: 80]


# Enable the Nerves integration with Mix
Application.start(:nerves_bootstrap)

config :rpi_firmware, target: Mix.target()

# Customize non-Elixir parts of the firmware. See
# https://hexdocs.pm/nerves/advanced-configuration.html for details.

config :nerves, :firmware, rootfs_overlay: "rootfs_overlay"

# Set the SOURCE_DATE_EPOCH date for reproducible builds.
# See https://reproducible-builds.org/docs/source-date-epoch/ for more information

config :nerves, source_date_epoch: "1624609688"

# Use Ringlogger as the logger backend and remove :console.
# See https://hexdocs.pm/ring_logger/readme.html for more information on
# configuring ring_logger.

config :logger, backends: [RingLogger]

if Mix.target() == :host or Mix.target() == :"" do
  import_config "host.exs"
else
  import_config "target.exs"
end

#config :rpi_firmware, cpu_condition_adapter: LiveCpuCondition

#config :nerves_leds, names: [green: "led0", red: "led1"]
