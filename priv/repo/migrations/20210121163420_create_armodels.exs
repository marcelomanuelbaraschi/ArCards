defmodule ArCards.Repo.Migrations.CreateArmodels do
  use Ecto.Migration

  def change do
    create table(:armodels) do
      add :name, :string
      add :code, :string
      add :gltf, :string
      add :patt, :string
      add :scale, :string
      add :cc, :string
      add :shop_id, :integer

      timestamps()
    end

  end
end
