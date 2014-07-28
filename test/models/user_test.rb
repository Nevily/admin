require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user username attribute must not be empty" do
    user = User.new
		assert user.invalid?
		assert user.errors[:username].any?
		assert user.errors[:gender].any?
  end

  test "has many posts" do  	
    user = User.reflect_on_association(:posts)
    assert_equal(user.macro, :has_many)
  end

  test "has a unique username" do
	 	user1 = User.new(username: "user1")
		user1.save
		user2 = User.new(username: "user2")
		user2.username = user1.username
		assert !user2.save
  end

  test "gender's possible values" do
  	user = User.new(gender: "male")
  	assert_includes(%w(male female), user.gender)
  end
end
