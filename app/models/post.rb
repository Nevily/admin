class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :testimonies, dependent: :destroy
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :testimonies

  validates :title, presence: true
  validates :venue, presence: true
  validates :description, presence: true
end