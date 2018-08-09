class CreateBooksCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :books_courses do |t|
      t.belongs_to :book, index: true
      t.belongs_to :course, index: true
      t.timestamps
    end
  end
end
