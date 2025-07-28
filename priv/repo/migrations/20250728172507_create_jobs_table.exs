defmodule App.Repo.Migrations.CreateJobsTable do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :title, :string
      add :description, :text

      timestamps()
    end
  end
end
