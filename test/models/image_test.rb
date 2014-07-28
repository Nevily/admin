require 'test_helper'

class ImageTest < ActiveSupport::TestCase

  test "image file attribute must not be empty" do
    image = Image.new
		assert image.invalid?
		assert image.errors[:file].any?
  end

  test "belongs to posts" do  	
    image = Image.reflect_on_association(:post)
    assert_equal(image.macro, :belongs_to)
  end
end