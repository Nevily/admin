class Image < ActiveRecord::Base
  belongs_to :post
  mount_uploader :file, FileUploader
  validates :file, presence: true  
end