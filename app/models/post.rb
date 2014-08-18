class Post < ActiveRecord::Base
  belongs_to :user, inverse_of: :posts
  belongs_to :category, inverse_of: :posts

  has_many :testimonies, inverse_of: :post, dependent: :destroy
  has_many :images, inverse_of: :post, dependent: :destroy

  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :testimonies

  validates :title, :venue, :description, presence: true

  scope :videos, -> { where.not( video: [nil, ""]) }
  scope :images, -> { joins(:images).group('post_id') }

  def self.search(search)
    if search
      where("title like ?", search)
    else
      Post.all
    end
  end
end