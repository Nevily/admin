class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :testimonies, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :videos, dependent: :destroy
  accepts_nested_attributes_for :images
end