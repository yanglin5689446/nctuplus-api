FactoryBot.define do
  factory :course_rating do
    course { create(:course) }
    category { Faker::Number.between(0, 2) }
    score { Faker::Number.between(0, 5) }
  end
end
