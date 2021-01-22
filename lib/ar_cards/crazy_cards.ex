defmodule ArCards.CrazyCards do
  @moduledoc """
  The CrazyCards context.
  """

  import Ecto.Query, warn: false
  alias ArCards.Repo

  alias ArCards.CrazyCards.MarkerBased

  @doc """
  Returns the list of armodels.

  ## Examples

      iex> list_armodels()
      [%MarkerBased{}, ...]

  """
  def list_armodels do
    Repo.all(MarkerBased)
  end

  @doc """
  Gets a single marker_based.

  Raises `Ecto.NoResultsError` if the Marker based does not exist.

  ## Examples

      iex> get_marker_based!(123)
      %MarkerBased{}

      iex> get_marker_based!(456)
      ** (Ecto.NoResultsError)

  """
  def get_marker_based!(id), do: Repo.get!(MarkerBased, id)

  @doc """
  Creates a marker_based.

  ## Examples

      iex> create_marker_based(%{field: value})
      {:ok, %MarkerBased{}}

      iex> create_marker_based(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_marker_based(attrs \\ %{}) do
    %MarkerBased{}
    |> MarkerBased.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a marker_based.

  ## Examples

      iex> update_marker_based(marker_based, %{field: new_value})
      {:ok, %MarkerBased{}}

      iex> update_marker_based(marker_based, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_marker_based(%MarkerBased{} = marker_based, attrs) do
    marker_based
    |> MarkerBased.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a marker_based.

  ## Examples

      iex> delete_marker_based(marker_based)
      {:ok, %MarkerBased{}}

      iex> delete_marker_based(marker_based)
      {:error, %Ecto.Changeset{}}

  """
  def delete_marker_based(%MarkerBased{} = marker_based) do
    Repo.delete(marker_based)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking marker_based changes.

  ## Examples

      iex> change_marker_based(marker_based)
      %Ecto.Changeset{data: %MarkerBased{}}

  """
  def change_marker_based(%MarkerBased{} = marker_based, attrs \\ %{}) do
    MarkerBased.changeset(marker_based, attrs)
  end
end
