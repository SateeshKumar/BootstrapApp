require 'test_helper'

class ProducttsControllerTest < ActionController::TestCase
  setup do
    @productt = productts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:productts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create productt" do
    assert_difference('Productt.count') do
      post :create, productt: { name: @productt.name, price: @productt.price }
    end

    assert_redirected_to productt_path(assigns(:productt))
  end

  test "should show productt" do
    get :show, id: @productt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @productt
    assert_response :success
  end

  test "should update productt" do
    put :update, id: @productt, productt: { name: @productt.name, price: @productt.price }
    assert_redirected_to productt_path(assigns(:productt))
  end

  test "should destroy productt" do
    assert_difference('Productt.count', -1) do
      delete :destroy, id: @productt
    end

    assert_redirected_to productts_path
  end
end
