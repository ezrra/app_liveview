defmodule App.Jobs do
  alias App.Repo
  alias App.Job

  def create_job(attrs) do
    %Job{}
    |> App.Job.changeset(attrs)
    |> Repo.insert()
  end
end
