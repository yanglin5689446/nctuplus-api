FactoryBot.define do
  sequence(:teacher_id) { |n| n }
  factory :teacher do
    id { generate(:teacher_id) }
    name { Faker::DragonBall.character }
  end
end
