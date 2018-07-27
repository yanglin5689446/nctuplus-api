class Book < ApplicationRecord
  belongs_to :user
  mount_uploader :cover_image, BookCoverUploader

  validates_numericality_of :price, only_integer: true
end
