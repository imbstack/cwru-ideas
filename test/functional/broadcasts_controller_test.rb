require 'test_helper'

class BroadcastsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:broadcasts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create broadcast" do
    assert_difference('Broadcast.count') do
      post :create, :broadcast => { }
    end

    assert_redirected_to broadcast_path(assigns(:broadcast))
  end

  test "should show broadcast" do
    get :show, :id => broadcasts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => broadcasts(:one).to_param
    assert_response :success
  end

  test "should update broadcast" do
    put :update, :id => broadcasts(:one).to_param, :broadcast => { }
    assert_redirected_to broadcast_path(assigns(:broadcast))
  end

  test "should destroy broadcast" do
    assert_difference('Broadcast.count', -1) do
      delete :destroy, :id => broadcasts(:one).to_param
    end

    assert_redirected_to broadcasts_path
  end
end
