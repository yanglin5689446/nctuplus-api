class Teacher < ApplicationRecord
  # 老師的 id = 學校教職員 id，
  # 每學期會重新匯入，
  # 因此沒有在 DB 設置 auto-increment & PK
  # workaround: 在 model 裡面設
  # @todo: 在不影響功能的前提下直接在 migration file 設置 primary key
  self.primary_key = :id
  has_many :teachers_courses
  has_many :courses, through: :teachers_courses
end
