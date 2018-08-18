class UsersCourseRating < ApplicationRecord
  belongs_to :user
  belongs_to :course_rating
end
