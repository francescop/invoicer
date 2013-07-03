require 'test_helper'

class TaxfieldsControllerTest < ActionController::TestCase
  setup do
    @taxfield = taxfields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:taxfields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create taxfield" do
    assert_difference('Taxfield.count') do
      post :create, taxfield: { amount: @taxfield.amount, taxtype: @taxfield.taxtype, title: @taxfield.title }
    end

    assert_redirected_to taxfield_path(assigns(:taxfield))
  end

  test "should show taxfield" do
    get :show, id: @taxfield
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @taxfield
    assert_response :success
  end

  test "should update taxfield" do
    put :update, id: @taxfield, taxfield: { amount: @taxfield.amount, taxtype: @taxfield.taxtype, title: @taxfield.title }
    assert_redirected_to taxfield_path(assigns(:taxfield))
  end

  test "should destroy taxfield" do
    assert_difference('Taxfield.count', -1) do
      delete :destroy, id: @taxfield
    end

    assert_redirected_to taxfields_path
  end
end
