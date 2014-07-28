require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "post attributes must not be empty" do
    post = Post.new
		assert post.invalid?
		assert post.errors[:title].any?
		assert post.errors[:venue].any?
    assert post.errors[:description].any?
  end

  test "has many testimonies and images" do  	
    post = Post.reflect_on_association(:testimonies)
    assert_equal(post.macro, :has_many)

    post = Post.reflect_on_association(:images)
    assert_equal(post.macro, :has_many)
  end

  test "belongs to user and category" do   
    post = Post.reflect_on_association(:user)
    assert_equal(post.macro, :belongs_to)

    post = Post.reflect_on_association(:category)
    assert_equal(post.macro, :belongs_to)
  end
end