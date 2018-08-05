FactoryBot.define do
  factory :course do
    code { Faker::Number.between(1000000, 9999999) }
    remarks { Faker::Lorem.paragraph }
    credit { Faker::Number.between(0, 15) }
    requirement_type { Faker::Number.between(0, 10) }
    grade { Faker::Number.between(0, 4) }
    classroom { Faker::Number.between(100, 999).to_s }
    time_slots do
      byte_array = 12.times.map { 0 }
      rand(5).times { byte_array[rand(8)] |= 1 << rand(8) }
      byte_array.map(&:chr).reduce(:+)
    end
    registration_count { 0 }
    registration_limit { 0 }
    assignment_record  { rand(5).times.map { 1 << rand(18) }.reduce(:+) }
    exam_record { rand(5).times.map { 1 << rand(18) }.reduce(:+) }
    rollcall_frequency { Faker::Number.between(0, 4) }
    last_edit_user { create(:user) }
    permanent_course { create(:permanent_course) }
    semester { create(:semester) }
    view_count { 0 }
  end
end
