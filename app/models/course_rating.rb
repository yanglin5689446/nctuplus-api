class CourseRating < ApplicationRecord
  belongs_to :users_course_rating
  belongs_to :course
end
