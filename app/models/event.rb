class Event < ApplicationRecord
  belongs_to :user
  mount_base64_uploader :cover_image, EventCoverUploader
end
