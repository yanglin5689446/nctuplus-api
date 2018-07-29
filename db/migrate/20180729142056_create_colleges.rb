class CreateColleges < ActiveRecord::Migration[5.0]
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :code, limit: 1, null: false
      t.timestamps
    end
  end
end
