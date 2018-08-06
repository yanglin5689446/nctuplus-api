class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :event_type
      t.string :title, null: false, default: 'untitled'
      t.string :organization
      t.string :location
      t.string :url
      t.string :content
      t.datetime :begin_time
      t.datetime :end_time
      t.references :user, foreign_key: true, index: true
      t.integer :view_count, default: 0
      t.string :cover_image
      t.timestamps
    end
  end
end
