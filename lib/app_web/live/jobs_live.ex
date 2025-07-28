defmodule AppWeb.JobsLive do
  #  use Phoenix.LiveView
  use AppWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    # Initialize the socket assigns
    # {:ok, assign(socket, :jobs, [])}

    socket = assign(socket, message: "Welcome to the Jobs Live View!")

    {:ok, socket}
  end

  def handle_event("update", _params, socket) do
    socket = assign(socket, message: "Language changed successfully!")

    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1>Jobs</h1>
      <p><%= @message %></p>
    </div>

    <div>
      <.link phx-click="update">
        Cambiar idioma.
      </.link>
    </div>
    """
  end
end
