require 'test_helper'

class VideosControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  setup do
    @post = Post.first
  end

  test "get videos index" do
    sign_in User.first
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "show video" do
    sign_in User.first
    get :show, id: @post
    assert_response :success
  end
end