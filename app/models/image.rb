class Image < ActiveRecord::Base
  belongs_to :post
  mount_uploader :file, FileUploader
  validates :file, presence: true
  
  def to_jq_upload
    {
      "name" => read_attribute(:file),
      "size" => file.size,
      "url" => file.url,
      "delete_url" => "/image/{#id}",
      "delete_type" => "DELETE" 
    }
  end
end