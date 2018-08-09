class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers, id: false do |t|
      t.integer :id, options: 'PRIMARY KEY'
      t.string :name
      t.timestamps
    end
  end
end
