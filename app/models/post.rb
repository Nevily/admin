class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :testimonies, dependent: :destroy
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :testimonies

  validates :title, :venue, :description, presence: true

  scope :get_videos, -> { where.not( video: [nil, ""]) }
  scope :get_images, -> { joins(:images).group('post_id') }

  def self.search(search)
    if search
      where("title like ?", search)
    else
      Post.all
    end
  end
end