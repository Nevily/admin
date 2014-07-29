class Image < ActiveRecord::Base
  belongs_to :post, inverse_of: :images
  mount_uploader :file, FileUploader
  validates :file, presence: true  
end