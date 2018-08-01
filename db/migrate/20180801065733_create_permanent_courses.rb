class CreatePermanentCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :permanent_courses do |t|
      t.string :name
      t.integer :credit
      t.string :code
      t.string :description
      t.integer :category
      t.integer :grade
      t.timestamps
    end
  end
end
