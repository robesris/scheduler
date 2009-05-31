require 'test_helper'

class RoleTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:role_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create role_types" do
    assert_difference('RoleTypes.count') do
      post :create, :role_types => { }
    end

    assert_redirected_to role_types_path(assigns(:role_types))
  end

  test "should show role_types" do
    get :show, :id => role_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => role_types(:one).to_param
    assert_response :success
  end

  test "should update role_types" do
    put :update, :id => role_types(:one).to_param, :role_types => { }
    assert_redirected_to role_types_path(assigns(:role_types))
  end

  test "should destroy role_types" do
    assert_difference('RoleTypes.count', -1) do
      delete :destroy, :id => role_types(:one).to_param
    end

    assert_redirected_to role_types_path
  end
end
