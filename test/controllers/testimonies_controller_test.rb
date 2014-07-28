require 'test_helper'

class TestimoniesControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  setup do
    @testimony = testimonies(:one)
  end

  test "get index" do
    sign_in User.first
    get :index
    assert_response :success
    assert_not_nil assigns(:testimonies)
  end

  test "get new" do
    sign_in User.first
    get :new
    assert_response :success
  end

  test "create testimony" do
    sign_in User.first
    assert_difference('Testimony.count') do
      post :create, testimony: { author: "author", content: "test"}
    end
    assert_redirected_to testimony_path(assigns(:testimony))
  end

  test "show testimony" do
    sign_in User.first
    get :show, id: @testimony
    assert_response :success
  end

  test "get edit" do
    sign_in User.first
    get :edit, id: @testimony
    assert_response :success
  end

  test "update testimony" do
    sign_in User.first
    patch :update, id: @testimony, testimony: { author: "author" }
    assert_redirected_to testimony_path(assigns(:testimony))
  end

  test "destroy testimony" do
    sign_in User.first
    assert_difference('Testimony.count', -1) do
      @post = @testimony.post
      delete :destroy, id: @testimony          
    end
    assert_redirected_to @post
  end
end