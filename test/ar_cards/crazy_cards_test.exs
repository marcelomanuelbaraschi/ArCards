defmodule ArCards.CrazyCardsTest do
  use ArCards.DataCase

  alias ArCards.CrazyCards

  describe "armodels" do
    alias ArCards.CrazyCards.MarkerBased

    @valid_attrs %{cc: "some cc", code: "some code", gltf: "some gltf", name: "some name", patt: "some patt", scale: "some scale", shop_id: 42}
    @update_attrs %{cc: "some updated cc", code: "some updated code", gltf: "some updated gltf", name: "some updated name", patt: "some updated patt", scale: "some updated scale", shop_id: 43}
    @invalid_attrs %{cc: nil, code: nil, gltf: nil, name: nil, patt: nil, scale: nil, shop_id: nil}

    def marker_based_fixture(attrs \\ %{}) do
      {:ok, marker_based} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CrazyCards.create_marker_based()

      marker_based
    end

    test "list_armodels/0 returns all armodels" do
      marker_based = marker_based_fixture()
      assert CrazyCards.list_armodels() == [marker_based]
    end

    test "get_marker_based!/1 returns the marker_based with given id" do
      marker_based = marker_based_fixture()
      assert CrazyCards.get_marker_based!(marker_based.id) == marker_based
    end

    test "create_marker_based/1 with valid data creates a marker_based" do
      assert {:ok, %MarkerBased{} = marker_based} = CrazyCards.create_marker_based(@valid_attrs)
      assert marker_based.cc == "some cc"
      assert marker_based.code == "some code"
      assert marker_based.gltf == "some gltf"
      assert marker_based.name == "some name"
      assert marker_based.patt == "some patt"
      assert marker_based.scale == "some scale"
      assert marker_based.shop_id == 42
    end

    test "create_marker_based/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CrazyCards.create_marker_based(@invalid_attrs)
    end

    test "update_marker_based/2 with valid data updates the marker_based" do
      marker_based = marker_based_fixture()
      assert {:ok, %MarkerBased{} = marker_based} = CrazyCards.update_marker_based(marker_based, @update_attrs)
      assert marker_based.cc == "some updated cc"
      assert marker_based.code == "some updated code"
      assert marker_based.gltf == "some updated gltf"
      assert marker_based.name == "some updated name"
      assert marker_based.patt == "some updated patt"
      assert marker_based.scale == "some updated scale"
      assert marker_based.shop_id == 43
    end

    test "update_marker_based/2 with invalid data returns error changeset" do
      marker_based = marker_based_fixture()
      assert {:error, %Ecto.Changeset{}} = CrazyCards.update_marker_based(marker_based, @invalid_attrs)
      assert marker_based == CrazyCards.get_marker_based!(marker_based.id)
    end

    test "delete_marker_based/1 deletes the marker_based" do
      marker_based = marker_based_fixture()
      assert {:ok, %MarkerBased{}} = CrazyCards.delete_marker_based(marker_based)
      assert_raise Ecto.NoResultsError, fn -> CrazyCards.get_marker_based!(marker_based.id) end
    end

    test "change_marker_based/1 returns a marker_based changeset" do
      marker_based = marker_based_fixture()
      assert %Ecto.Changeset{} = CrazyCards.change_marker_based(marker_based)
    end
  end
end
