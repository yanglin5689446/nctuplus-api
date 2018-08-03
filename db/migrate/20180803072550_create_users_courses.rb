class CreateUsersCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :users_courses do |t|
      t.belongs_to :user, index: true
      t.belongs_to :course, index: true
      t.timestamps
    end
  end
end
