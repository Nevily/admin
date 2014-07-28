require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  setup do
    @post = posts(:one)
  end

  test "show post" do
    sign_in User.first
    get :show, id: @post
    assert_response :success
  end

  test "get new" do
    sign_in User.first
    get :new
    assert_response :success
  end

   test "create post" do
    sign_in User.first
    assert_difference('Post.count') do
      test_image = "#{Rails.root}/public/images/rails.png"
      file = Rack::Test::UploadedFile.new(test_image, "image/png")
      post :create, post: { title: "post", venue: "The Netherlands", description: "test", images: file }
    end
    assert_redirected_to post_path(assigns(:post))
  end

  test "get edit" do
    sign_in User.first
    get :edit, id: @post
    assert_response :success
  end

  test "update post" do
    sign_in User.first
    patch :update, id: @post, post: { title: "post" }
    assert_redirected_to post_path(assigns(:post))
  end

  test "destroy post" do
    sign_in User.first
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end
    assert_redirected_to pages_index_path
  end
end