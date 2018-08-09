FactoryBot.define do
  factory :course_rating do
    category { Faker::Number.between(0, 3) }
    score { Faker::Number.between(0, 5) }
  end
end
