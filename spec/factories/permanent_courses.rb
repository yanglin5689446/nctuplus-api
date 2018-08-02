FactoryBot.define do
  factory :permanent_course do
    name { Faker::Educator.course }
    code { Faker::Number.between(1000000, 9999999).to_s }
    description { Faker::Lorem.sentence }
  end
end
