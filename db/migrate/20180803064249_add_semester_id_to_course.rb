class AddSemesterIdToCourse < ActiveRecord::Migration[5.2]
  def change
    add_reference :courses, :semester, foreign_key: true, index: true
  end
end
