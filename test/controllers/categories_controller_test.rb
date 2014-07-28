require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  setup do
    @category = categories(:one)
  end

  test "get index" do
    sign_in User.first
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "get new" do
    sign_in User.first
    get :new
    assert_response :success
  end

  test "create category" do
    sign_in User.first
    assert_difference('Category.count') do
      post :create, category: { title: "category" }
    end
    assert_redirected_to category_path(assigns(:category))
  end

  test "show category" do
    sign_in User.first
    get :show, id: @category
    assert_response :success
  end

  test "get edit" do
    sign_in User.first
    get :edit, id: @category
    assert_response :success
  end

  test "update category" do
    sign_in User.first
    patch :update, id: @category, category: { title: "category" }
    assert_redirected_to category_path(assigns(:category))
  end

  test "destroy category" do
    sign_in User.first
    assert_difference('Category.count', -1) do
      delete :destroy, id: @category
    end

    assert_redirected_to categories_path
  end
end