class Testimony < ActiveRecord::Base
  belongs_to :post, inverse_of: :testimonies
  validates :author, :content, presence: true
end
