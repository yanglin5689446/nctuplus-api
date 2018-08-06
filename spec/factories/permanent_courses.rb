FactoryBot.define do
  factory :permanent_course do
    name { Faker::Educator.course }
    code { Faker::Number.between(1_000_000, 9_999_999).to_s }
    description { Faker::Lorem.sentence }
  end
end
