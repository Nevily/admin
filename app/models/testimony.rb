class Testimony < ActiveRecord::Base
  belongs_to :post
  
  validates :author, presence: true
  validates :content, presence: true
end
