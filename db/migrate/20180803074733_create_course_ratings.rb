class CreateCourseRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :course_ratings do |t|

      t.timestamps
    end
  end
end
