class CreateUsersCourseRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :users_course_ratings do |t|
      t.belongs_to :user, index: true
      t.belongs_to :course_rating, index: true
      t.timestamps
    end
  end
end
