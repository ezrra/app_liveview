defmodule App.Jobs do
  import Ecto.Query, warn: false

  alias App.Repo
  alias App.Job

  def create_job(attrs) do
    %Job{}
    |> App.Job.changeset(attrs)
    |> Repo.insert()
  end

  def list_jobs do
    # Repo.all(Job)

    query =
      from(j in Job,
        order_by: [desc: j.inserted_at]
      )
    # query = from(jobs in Job, order_by: [desc: inserted_at])

    Repo.all(query)
  end
end
