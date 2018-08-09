class CreateTeachersCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers_courses do |t|
      t.belongs_to :teacher, index: true
      t.belongs_to :course, index: true
      t.timestamps
    end
  end
end
