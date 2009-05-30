require 'test_helper'

class ExpansionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expansions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expansion" do
    assert_difference('Expansion.count') do
      post :create, :expansion => { }
    end

    assert_redirected_to expansion_path(assigns(:expansion))
  end

  test "should show expansion" do
    get :show, :id => expansions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => expansions(:one).to_param
    assert_response :success
  end

  test "should update expansion" do
    put :update, :id => expansions(:one).to_param, :expansion => { }
    assert_redirected_to expansion_path(assigns(:expansion))
  end

  test "should destroy expansion" do
    assert_difference('Expansion.count', -1) do
      delete :destroy, :id => expansions(:one).to_param
    end

    assert_redirected_to expansions_path
  end
end
