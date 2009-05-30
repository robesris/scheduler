require 'test_helper'

class RaidsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:raids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create raid" do
    assert_difference('Raid.count') do
      post :create, :raid => { }
    end

    assert_redirected_to raid_path(assigns(:raid))
  end

  test "should show raid" do
    get :show, :id => raids(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => raids(:one).to_param
    assert_response :success
  end

  test "should update raid" do
    put :update, :id => raids(:one).to_param, :raid => { }
    assert_redirected_to raid_path(assigns(:raid))
  end

  test "should destroy raid" do
    assert_difference('Raid.count', -1) do
      delete :destroy, :id => raids(:one).to_param
    end

    assert_redirected_to raids_path
  end
end
