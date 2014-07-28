require 'test_helper'

class TestimonyTest < ActiveSupport::TestCase
  test "testimony attributes must not be empty" do
    testimony = Testimony.new
		assert testimony.invalid?
		assert testimony.errors[:author].any?
		assert testimony.errors[:content].any?
  end

  test "belongs to post" do  	
    testimony = Testimony.reflect_on_association(:post)
    assert_equal(testimony.macro, :belongs_to)
  end
end