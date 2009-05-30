require 'test_helper'

class InstanceNamesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:instance_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create instance_name" do
    assert_difference('InstanceName.count') do
      post :create, :instance_name => { }
    end

    assert_redirected_to instance_name_path(assigns(:instance_name))
  end

  test "should show instance_name" do
    get :show, :id => instance_names(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => instance_names(:one).to_param
    assert_response :success
  end

  test "should update instance_name" do
    put :update, :id => instance_names(:one).to_param, :instance_name => { }
    assert_redirected_to instance_name_path(assigns(:instance_name))
  end

  test "should destroy instance_name" do
    assert_difference('InstanceName.count', -1) do
      delete :destroy, :id => instance_names(:one).to_param
    end

    assert_redirected_to instance_names_path
  end
end
