require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "category title attribute must not be empty" do
    category = Category.new
		assert category.invalid?
		assert category.errors[:title].any?
  end

  test "has many posts" do  	
    category = Category.reflect_on_association(:posts)
    assert_equal(category.macro, :has_many)
  end
end