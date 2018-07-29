FactoryBot.define do
  factory :department do
    name { Faker::Company.name }
    category { Faker::Number.between(0, 8) }
    department_type { [:C, :D, :E, :F, :G, :H].sample }
    code { Faker::Number.number(2).to_s }
    college { create(:college) }
  end
end
