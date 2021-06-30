defmodule RpiUiWeb.TempLive do

  use RpiUiWeb, :live_view
  require Logger

  @impl true
  def render(assigns) do
    ~L"""
    <section class="row">
      <article class="column">
        <div>
          <h2>Data: <%= @temp %></h2>
        </div>
      </article>
    </section>
    """
  end

  @impl true
  def mount(_param, _session, socket) do

    Phoenix.PubSub.subscribe(RpiUi.PubSub, "cputemp")

    {:ok, assign(socket, temp:  "--")}

  end

  @impl true
  def handle_event(:cputemp, temp, socket) do

    Logger.info("Handle event")

    {:noreply, update(socket, :temp, temp)}

  end

  def handle_info(temp, socket) do

    Logger.info("Handle info: #{temp}")

    {:noreply, assign(socket, temp:  temp)}
  end
end
