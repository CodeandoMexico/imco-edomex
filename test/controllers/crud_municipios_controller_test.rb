require 'test_helper'

class CrudMunicipiosControllerTest < ActionController::TestCase
  setup do
    @crud_municipio = crud_municipios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crud_municipios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crud_municipio" do
    assert_difference('CrudMunicipio.count') do
      post :create, crud_municipio: { nombre: @crud_municipio.nombre }
    end

    assert_redirected_to crud_municipio_path(assigns(:crud_municipio))
  end

  test "should show crud_municipio" do
    get :show, id: @crud_municipio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @crud_municipio
    assert_response :success
  end

  test "should update crud_municipio" do
    patch :update, id: @crud_municipio, crud_municipio: { nombre: @crud_municipio.nombre }
    assert_redirected_to crud_municipio_path(assigns(:crud_municipio))
  end

  test "should destroy crud_municipio" do
    assert_difference('CrudMunicipio.count', -1) do
      delete :destroy, id: @crud_municipio
    end

    assert_redirected_to crud_municipios_path
  end
end
