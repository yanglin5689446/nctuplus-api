class CreateTimetables < ActiveRecord::Migration[5.2]
  def change
    create_table :timetables do |t|
      t.belongs_to :user, index: true
      t.boolean :shareable, default: false
      t.timestamps
    end
  end
end
