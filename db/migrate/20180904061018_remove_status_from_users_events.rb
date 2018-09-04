class RemoveStatusFromUsersEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :users_events, :status, :integer
  end
end
