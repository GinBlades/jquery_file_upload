class Upload < ActiveRecord::Base
  mount_uploader :thing, ThingUploader
  include Rails.application.routes.url_helpers
  def to_jq_upload
    {
      "name" => thing.file.filename,
      "size" => thing.file.size,
      "url" => thing.url,
      "delete_url" => upload_path(self),
      "delete_type" => "DELETE" 
    }
  end
end
