class Course < ApplicationRecord
  belongs_to :semester
  belongs_to :last_edit_user, class_name: :User, optional: true
  belongs_to :permanent_course
  has_many :teachers_courses
  has_many :teachers, through: :teachers_courses
  has_many :users_courses
  has_many :users, through: :users_courses
  has_many :books_courses
  has_many :books, through: :books_courses
  has_many :course_ratings

  enum time_slot_code: %I[M N A B C D X E F G H Y I J k L]

  # Currently in DB we use 12bytes(96bit) to preserve course time slots
  # (16 slots * 6 days per week = 96bit),
  # thus we need to convert it to human readable form,
  # before passing data to frontend.
  # TODO: should we do this at frontend?
  def convert_time_slots
    time_slots
      .chars.each_slice(2)
      .map { |data| data.join('').unpack1('S') }
      .map.with_index do |data, index|
        16.times
          .select { |i| (data & (1 << i)).positive? }
          .map { |i| self.class.time_slot_codes.key(i) }
          .reduce((index + 1).to_s, :+)
      end
      .select { |r| r.length > 1 }
      .join
  end

  # override json serializer, add converted time slots
  # TODO: should we use fast_jsonapi?
  # TODO: should we include raw data?
  def as_json(options = {})
    super({ **options, except: :time_slots }).tap do |result|
      result[:time_slots] = convert_time_slots
    end
  end
end
