FactoryBot.define do
  factory :permanent_course do
    name { Faker::Educator.course }
    credit { Faker::Number.between(0, 15) }
    code { Faker::Number.between(1000000, 9999999).to_s }
    description { Faker::Lorem.sentence }
    category { Faker::Number.between(0, 10) }
    grade { Faker::Number.between(0, 4) }
    department { create(:department) }
  end
end
