class CreateBooksCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :books_courses do |t|

      t.timestamps
    end
  end
end
