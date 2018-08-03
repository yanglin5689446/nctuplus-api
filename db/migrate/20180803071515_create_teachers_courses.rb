class CreateTeachersCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers_courses do |t|

      t.timestamps
    end
  end
end
