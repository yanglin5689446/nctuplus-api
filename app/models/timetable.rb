class Timetable < ApplicationRecord
  belongs_to :user
  has_many :timetables_courses
  has_many :courses, through: :timetables_courses
end
