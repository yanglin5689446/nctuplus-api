FactoryBot.define do
  factory :user do
    name { Faker::Name.name.truncate(16) }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
    admission_year { Faker::Number.between(90, 120) }
  end
end
