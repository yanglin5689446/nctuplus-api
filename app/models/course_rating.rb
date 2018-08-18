class CourseRating < ApplicationRecord
  belongs_to :users_course_ratings
  belongs_to :course
end
