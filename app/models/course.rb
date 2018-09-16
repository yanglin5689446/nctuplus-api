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
  has_many :ratings, foreign_key: :course_id, class_name: :CourseRating

  enum time_slot_code: %I[M N A B C D X E F G H Y I J k L]

  # 現在 DB 裡用 12bytes(96bit) 的 binary 來保存課程時段
  # (16 的時段 * 每週 6 天 = 96(bit)),
  # 所以在傳給前端時我們需要轉換成比較容易讀得懂的形式
  def convert_time_slots
    # 96bits
    # 切成 6 個 2bytes 的 string
    # 將每個 2bytes string 轉成長度 16 的 bitmask: [0, 1, 1 ...., 0]
    # 將每個 bitmask 轉成時段對應的英文字母陣列: ['A', 'B', 'M']
    # 將字母陣列跟 index 結合: [0, ['A, 'B', 'M']]
    # 將前面作成的 array 轉成 hash
    time_slots
      .chars.each_slice(2)
      .map { |data| data.join('').unpack1('S') }
      .map do |data|
        16.times
          .select { |i| (data & (1 << i)).positive? }
          .map { |i| self.class.time_slot_codes.key(i) }
      end
      .map.with_index { |data, index| [index, data] }
      .each_with_object({}) do |entry, result|
        key = entry[0] + 1
        value = entry[1]
        result[key] = value unless value.empty?
        result
      end
  end

  # 重載 json serializer
  def serializable_hash(options = nil)
    options = options.try(:dup) || {}

    # relation 的 foreign_key 不需要了直接移除
    excepts = %I[time_slots semester_id permanent_course_id]
    super({ **options, except: excepts }).tap do |result|
      result[:time_slots] = convert_time_slots
      # 預設直接引入 relation, 不用在 controller 裡自己加
      result[:semester] = semester
      result[:permanent_course] = permanent_course
      result[:teachers] = teachers
      result[:ratings] = ratings
    end
  end
end
