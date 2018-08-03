class BooksCourse < ApplicationRecord
  belongs_to :book
  belongs_to :event
end
