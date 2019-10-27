require "application_system_test_case"

class FavoritosTest < ApplicationSystemTestCase
  setup do
    @favorito = favoritos(:one)
  end

  test "visiting the index" do
    visit favoritos_url
    assert_selector "h1", text: "Favoritos"
  end

  test "creating a Favorito" do
    visit favoritos_url
    click_on "New Favorito"

    fill_in "Comentario", with: @favorito.comentario
    fill_in "Url", with: @favorito.url
    click_on "Create Favorito"

    assert_text "Favorito was successfully created"
    click_on "Back"
  end

  test "updating a Favorito" do
    visit favoritos_url
    click_on "Edit", match: :first

    fill_in "Comentario", with: @favorito.comentario
    fill_in "Url", with: @favorito.url
    click_on "Update Favorito"

    assert_text "Favorito was successfully updated"
    click_on "Back"
  end

  test "destroying a Favorito" do
    visit favoritos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Favorito was successfully destroyed"
  end
end
