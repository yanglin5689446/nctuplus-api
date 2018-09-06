class UsersEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event, counter_cache: :follow_count
end
