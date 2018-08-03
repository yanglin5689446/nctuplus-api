class CreateTimetablesCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :timetables_courses do |t|

      t.timestamps
    end
  end
end
