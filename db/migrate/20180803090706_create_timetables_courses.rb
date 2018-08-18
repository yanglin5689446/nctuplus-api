class CreateTimetablesCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :timetables_courses do |t|
      t.belongs_to :timetable, index: true
      t.belongs_to :course, index: true
      t.timestamps
    end
  end
end
