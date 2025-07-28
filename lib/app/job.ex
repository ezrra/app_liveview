defmodule App.Job do
  use Ecto.Schema

  import Ecto.Changeset

  schema "jobs" do
    field :title, :string
    field :description, :string

    timestamps()
  end

  def changeset(job, attrs \\ %{}) do
    job
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
