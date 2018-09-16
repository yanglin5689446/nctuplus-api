class PastExam < ApplicationRecord
  belongs_to :course
  belongs_to :uploader, class_name: :User
  mount_base64_uploader :file, PastExamUploader

  def serializable_hash(options = nil)
    options = options.try(:dup) || {}
    super({ **options, except: [:uploader_id, :course_id] }).tap do |result|
      result[:uploader] = uploader
      result[:course] = course
    end
  end
end
