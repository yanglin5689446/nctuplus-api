FactoryBot.define do
  factory :college do
    name { Faker::Company.name }
    code { 'A' }
  end
end
