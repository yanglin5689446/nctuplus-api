class CreateUsersCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :users_courses do |t|

      t.timestamps
    end
  end
end
