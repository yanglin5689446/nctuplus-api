class CreateDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.integer :category, null: false, default: 0
      t.string :department_type, limit: 1
      t.string :code, limit: 2
      t.references :college, foreign_key: true, index: true
      t.timestamps
    end
  end
end
