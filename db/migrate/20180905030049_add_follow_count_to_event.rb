class AddFollowCountToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :follow_count, :integer, :default => 0
  end
end
