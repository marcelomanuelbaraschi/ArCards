defmodule ArCardsWeb.MarkerBasedController do
  use ArCardsWeb, :controller

  alias ArCards.CrazyCards
  alias ArCards.CrazyCards.MarkerBased

  def index(conn, _params) do
    armodels = CrazyCards.list_armodels()

    render(
      conn,
      "index.html",
      armodels: armodels,
      layout: {ArCardsWeb.LayoutView, "crazycards.html"}
    )
  end

  def new(conn, _params) do
    changeset = CrazyCards.change_marker_based(%MarkerBased{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"marker_based" => marker_based_params}) do
    case CrazyCards.create_marker_based(marker_based_params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Marker based created successfully.")
        |> redirect(to: Routes.marker_based_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    marker_based = CrazyCards.get_marker_based!(id)

    render(
      conn,
      "scene.html",
      marker_based: marker_based,
      layout: {ArCardsWeb.LayoutView, "stage.html"}
    )
  end

  def edit(conn, %{"id" => id}) do
    marker_based = CrazyCards.get_marker_based!(id)
    changeset = CrazyCards.change_marker_based(marker_based)
    render(conn, "edit.html", marker_based: marker_based, changeset: changeset)
  end

  def update(conn, %{"id" => id, "marker_based" => marker_based_params}) do
    marker_based = CrazyCards.get_marker_based!(id)

    case CrazyCards.update_marker_based(marker_based, marker_based_params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Marker based updated successfully.")
        |> redirect(to: Routes.marker_based_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", marker_based: marker_based, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    marker_based = CrazyCards.get_marker_based!(id)
    {:ok, _marker_based} = CrazyCards.delete_marker_based(marker_based)

    conn
    |> put_flash(:info, "Marker based deleted successfully.")
    |> redirect(to: Routes.marker_based_path(conn, :index))
  end
end
