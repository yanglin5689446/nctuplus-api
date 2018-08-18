class CreateUsersCourseRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :users_course_ratings, &:timestamps
  end
end
