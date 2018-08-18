FactoryBot.define do
  factory :timetable do
    user { create(:user) }
  end
end
