class PastExam < ApplicationRecord
  belongs_to :course
  belongs_to :uploader, class_name: :User
  mount_base64_uploader :file, PastExamUploader
end
