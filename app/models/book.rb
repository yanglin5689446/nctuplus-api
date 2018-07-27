class Book < ApplicationRecord
  belongs_to :user

  validates_numericality_of :price, only_integer: true
end
