require 'test_helper'

class FavoritosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favorito = favoritos(:one)
  end

  test "should get index" do
    get favoritos_url
    assert_response :success
  end

  test "should get new" do
    get new_favorito_url
    assert_response :success
  end

  test "should create favorito" do
    assert_difference('Favorito.count') do
      post favoritos_url, params: { favorito: { comentario: @favorito.comentario, url: @favorito.url } }
    end

    assert_redirected_to favorito_url(Favorito.last)
  end

  test "should show favorito" do
    get favorito_url(@favorito)
    assert_response :success
  end

  test "should get edit" do
    get edit_favorito_url(@favorito)
    assert_response :success
  end

  test "should update favorito" do
    patch favorito_url(@favorito), params: { favorito: { comentario: @favorito.comentario, url: @favorito.url } }
    assert_redirected_to favorito_url(@favorito)
  end

  test "should destroy favorito" do
    assert_difference('Favorito.count', -1) do
      delete favorito_url(@favorito)
    end

    assert_redirected_to favoritos_url
  end
end
