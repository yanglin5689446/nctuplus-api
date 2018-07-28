class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.timestamps
      t.string :name
      t.string :isbn
      t.string :authors
      t.string :info
      t.string :cover_image
      t.string :preview_url
      t.references :user, foreign_key: true, index: true
      t.integer :price, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.integer :view_count, null: false, default: 0
    end
  end
end
