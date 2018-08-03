class TimetablesCourse < ApplicationRecord
  belongs_to :timetable
  belongs_to :course
end
