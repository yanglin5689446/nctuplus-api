class CreateUsersEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :users_events do |t|
      t.belongs_to :user, index: true
      t.belongs_to :event, index: true
      t.integer :status
      t.timestamps
    end
  end
end
