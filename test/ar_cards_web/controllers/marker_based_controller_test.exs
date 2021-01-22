defmodule ArCardsWeb.MarkerBasedControllerTest do
  use ArCardsWeb.ConnCase

  alias ArCards.CrazyCards

  @create_attrs %{cc: "some cc", code: "some code", gltf: "some gltf", name: "some name", patt: "some patt", scale: "some scale", shop_id: 42}
  @update_attrs %{cc: "some updated cc", code: "some updated code", gltf: "some updated gltf", name: "some updated name", patt: "some updated patt", scale: "some updated scale", shop_id: 43}
  @invalid_attrs %{cc: nil, code: nil, gltf: nil, name: nil, patt: nil, scale: nil, shop_id: nil}

  def fixture(:marker_based) do
    {:ok, marker_based} = CrazyCards.create_marker_based(@create_attrs)
    marker_based
  end

  describe "index" do
    test "lists all armodels", %{conn: conn} do
      conn = get(conn, Routes.marker_based_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Armodels"
    end
  end

  describe "new marker_based" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.marker_based_path(conn, :new))
      assert html_response(conn, 200) =~ "New Marker based"
    end
  end

  describe "create marker_based" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.marker_based_path(conn, :create), marker_based: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.marker_based_path(conn, :show, id)

      conn = get(conn, Routes.marker_based_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Marker based"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.marker_based_path(conn, :create), marker_based: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Marker based"
    end
  end

  describe "edit marker_based" do
    setup [:create_marker_based]

    test "renders form for editing chosen marker_based", %{conn: conn, marker_based: marker_based} do
      conn = get(conn, Routes.marker_based_path(conn, :edit, marker_based))
      assert html_response(conn, 200) =~ "Edit Marker based"
    end
  end

  describe "update marker_based" do
    setup [:create_marker_based]

    test "redirects when data is valid", %{conn: conn, marker_based: marker_based} do
      conn = put(conn, Routes.marker_based_path(conn, :update, marker_based), marker_based: @update_attrs)
      assert redirected_to(conn) == Routes.marker_based_path(conn, :show, marker_based)

      conn = get(conn, Routes.marker_based_path(conn, :show, marker_based))
      assert html_response(conn, 200) =~ "some updated cc"
    end

    test "renders errors when data is invalid", %{conn: conn, marker_based: marker_based} do
      conn = put(conn, Routes.marker_based_path(conn, :update, marker_based), marker_based: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Marker based"
    end
  end

  describe "delete marker_based" do
    setup [:create_marker_based]

    test "deletes chosen marker_based", %{conn: conn, marker_based: marker_based} do
      conn = delete(conn, Routes.marker_based_path(conn, :delete, marker_based))
      assert redirected_to(conn) == Routes.marker_based_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.marker_based_path(conn, :show, marker_based))
      end
    end
  end

  defp create_marker_based(_) do
    marker_based = fixture(:marker_based)
    %{marker_based: marker_based}
  end
end
