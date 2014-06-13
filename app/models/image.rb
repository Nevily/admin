class Image < ActiveRecord::Base
  belongs_to :post
  mount_uploader :file, FileUploader

  def to_jq_upload
    {
      "name" => read_attribute(:file),
      "size" => file.size,
      "url" => file.url,
      "delete_url" => "/images/#{id}",
      "delete_type" => "DELETE"
    }
  end
end