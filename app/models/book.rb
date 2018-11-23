class Book < ApplicationRecord
  mount_base64_uploader :cover_image, BookCoverUploader

  belongs_to :user
  has_many :books_courses
  has_many :courses, through: :books_courses
  accepts_nested_attributes_for :books_courses, allow_destroy: true

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

  def add_applicable_courses(course_id_array)
    courses << Course.includes(:teachers, :permanent_course)
                     .find(course_id_array)
  end

  def update_book(book_params, course_id_array)
    index = 0
    books_courses_ = books_courses.order(:course_id)
    books_courses_id_delete_array = []
    new_books_courses_id_array = []
    course_id_array.each do |course_id|
      comparison_result = 1
      until books_courses_[index].nil?
        comparison_result = course_id <=> books_courses_[index][:course_id]
        case comparison_result
        when 1
          books_courses_id_delete_array << books_courses_[index][:id]
          index += 1
        when 0
          index += 1
          break
        when -1
          new_books_courses_id_array << course_id
          break
        end
      end
      new_books_courses_id_array << course_id if comparison_result == 1
    end
    books_courses_[index..-1].try(:each) do |books_course|
      books_courses_id_delete_array << books_course[:id]
    end
    books_courses.where(id: books_courses_id_delete_array).delete_all
    courses << Course.find(new_books_courses_id_array)
    courses.reload
    update(book_params)
  end
end
