require 'test_helper'

class ImagesControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  setup do
    @image = images(:one)
  end

  test "get images index" do
    sign_in User.first
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "get edit" do
    sign_in User.first
    get :edit, id: @image
    assert_response :success
  end

  test "update image" do
    sign_in User.first
    test_image = "#{Rails.root}/public/images/rails.png"
    file = Rack::Test::UploadedFile.new(test_image, "image/png")
    @post = @image.post
    patch :update, id: @image, image: { file: file }
    assert_redirected_to @post
  end

  test "destroy image" do
    sign_in User.first
    assert_difference('Image.count', -1) do
      @post = @image.post
      delete :destroy, id: @image
    end
    assert_redirected_to @post
  end
end