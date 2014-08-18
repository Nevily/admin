class Category < ActiveRecord::Base
  has_many :posts, inverse_of: :category
  validates :title, presence: true
end
