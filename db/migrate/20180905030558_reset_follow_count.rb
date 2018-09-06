class ResetFollowCount < ActiveRecord::Migration[5.2]
  def change
    Event.pluck(:id).each do |i|
      Event.reset_counters(i, :users_events)
    end
  end
end
