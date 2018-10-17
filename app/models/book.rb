class Book < ApplicationRecord
  mount_base64_uploader :cover_image, BookCoverUploader

  belongs_to :user
  has_many :books_courses
  has_many :courses, through: :books_courses

  validates_numericality_of :price, only_integer: true

  def serializable_hash(options = nil)
    options = options.try(:dup) || {}

    super({ **options, except: :user_id }).tap do |result|
      result[:user] = user.serializable_hash(only: [:id, :name])
      result[:courses] = [].tap do |i|
        courses.each do |course|
          i << course.serializable_hash_for_books
        end
      end
    end
  end
end
