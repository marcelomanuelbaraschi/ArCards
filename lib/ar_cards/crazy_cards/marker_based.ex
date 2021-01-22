defmodule ArCards.CrazyCards.MarkerBased do
  use Ecto.Schema
  import Ecto.Changeset

  schema "armodels" do
    field :cc, :string
    field :code, :string
    field :gltf, :string
    field :name, :string
    field :patt, :string
    field :scale, :string
    field :shop_id, :integer

    timestamps()
  end

  @doc false
  def changeset(marker_based, attrs) do
    marker_based
    |> cast(attrs, [:name, :code, :gltf, :patt, :scale, :cc, :shop_id])
    |> validate_required([:name, :code, :gltf, :patt, :scale, :cc, :shop_id])
  end
end
