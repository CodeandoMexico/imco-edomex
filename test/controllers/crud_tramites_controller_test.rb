require 'test_helper'

class CrudTramitesControllerTest < ActionController::TestCase
  setup do
    @crud_tramite = crud_tramites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crud_tramites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crud_tramite" do
    assert_difference('CrudTramite.count') do
      post :create, crud_tramite: { giro: @crud_tramite.giro, local_determinado: @crud_tramite.local_determinado, nombre: @crud_tramite.nombre, remodelacion: @crud_tramite.remodelacion }
    end

    assert_redirected_to crud_tramite_path(assigns(:crud_tramite))
  end

  test "should show crud_tramite" do
    get :show, id: @crud_tramite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @crud_tramite
    assert_response :success
  end

  test "should update crud_tramite" do
    patch :update, id: @crud_tramite, crud_tramite: { giro: @crud_tramite.giro, local_determinado: @crud_tramite.local_determinado, nombre: @crud_tramite.nombre, remodelacion: @crud_tramite.remodelacion }
    assert_redirected_to crud_tramite_path(assigns(:crud_tramite))
  end

  test "should destroy crud_tramite" do
    assert_difference('CrudTramite.count', -1) do
      delete :destroy, id: @crud_tramite
    end

    assert_redirected_to crud_tramites_path
  end
end
