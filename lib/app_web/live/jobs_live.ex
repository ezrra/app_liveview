defmodule AppWeb.JobsLive do
  #  use Phoenix.LiveView
  use AppWeb, :live_view

  alias App.Job
  alias App.Jobs

  @impl true
  def mount(_params, _session, socket) do
    job = %Job{}
    changeset = Job.changeset(job)
    jobs = Jobs.list_jobs()

    socket = assign(socket, changeset: changeset, job: job, jobs: jobs)

    {:ok, socket}
  end

  @impl true
  def handle_event("validate", %{"job" => params}, socket) do
    changeset =
      socket.assigns.job
      |> Job.changeset(params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, changeset: changeset)}
  end

  @impl true
  def handle_event("save", %{"job" => params}, socket) do
    case Jobs.create_job(params) do
      {:ok, _job} ->
        {:noreply,
          socket
          |> put_flash(:info, "Trabajo creado exitosamente.")
          |> push_navigate(to: ~p"/jobs")
        }

      {:error, changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="space-y-8">
      <.form :let={f} for={@changeset} phx-change="validate" phx-submit="save" class="space-y-6">
        <.input type="text" field={f[:title]} />
        <.input type="text" field={f[:description]} />
        <.button>Crear</.button>
      </.form>

      <div>
        <h2>Lista de trabajos</h2>

        <%= for job <- @jobs do %>
          <div class="border-b last:border-b-0 py-2">
            <strong><%= job.title %></strong>: <%= job.description %>
          </div>
        <% end %>
      </div>
    </div>
    """
  end
end
