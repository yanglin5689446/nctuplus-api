class Course < ApplicationRecord
  belongs_to :last_edit_user, class_name: :User, optional: true
  belongs_to :permanent_course
end
