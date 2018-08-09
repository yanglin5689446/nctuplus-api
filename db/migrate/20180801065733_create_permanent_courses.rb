class CreatePermanentCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :permanent_courses do |t|
      t.string :name
      t.string :code
      t.string :description
      t.timestamps
    end
  end
end
