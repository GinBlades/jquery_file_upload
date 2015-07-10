class Upload < ActiveRecord::Base
  mount_uploader :thing, ThingUploader
end
