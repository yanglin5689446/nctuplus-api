class UsersEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum status: [:follow, :participate]
end
