require 'test_helper'

class InvoicefieldsControllerTest < ActionController::TestCase
  setup do
    @invoicefield = invoicefields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoicefields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoicefield" do
    assert_difference('Invoicefield.count') do
      post :create, invoicefield: { amount: @invoicefield.amount, invoice_id: @invoicefield.invoice_id, title: @invoicefield.title, type: @invoicefield.type }
    end

    assert_redirected_to invoicefield_path(assigns(:invoicefield))
  end

  test "should show invoicefield" do
    get :show, id: @invoicefield
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invoicefield
    assert_response :success
  end

  test "should update invoicefield" do
    put :update, id: @invoicefield, invoicefield: { amount: @invoicefield.amount, invoice_id: @invoicefield.invoice_id, title: @invoicefield.title, type: @invoicefield.type }
    assert_redirected_to invoicefield_path(assigns(:invoicefield))
  end

  test "should destroy invoicefield" do
    assert_difference('Invoicefield.count', -1) do
      delete :destroy, id: @invoicefield
    end

    assert_redirected_to invoicefields_path
  end
end
