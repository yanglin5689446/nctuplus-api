class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :code
      t.string :remarks
      t.integer :credit
      t.integer :requirement_type
      t.integer :grade
      t.string :classroom
      t.binary :time_slots, limit: 12
      t.integer :registration_count
      t.integer :registration_limit
      t.integer :assignment_record
      t.integer :exam_record
      t.integer :rollcall_frequency
      t.integer :view_count, default: 0
      t.references :last_edit_user, references: :users, index: true
      t.belongs_to :permanent_course, index: true
      t.timestamps
    end
  end
end
