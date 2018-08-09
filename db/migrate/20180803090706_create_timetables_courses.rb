class CreateTimetablesCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :timetables_courses do |t|
      t.belongs_to :timetable
      t.belongs_to :course
      t.timestamps
    end
  end
end
