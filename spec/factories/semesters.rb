FactoryBot.define do
  sequence(:year) { |n| ((n - 1) / 3) + 99 }
  sequence(:term) { |n| (n - 1) % 3 }

  factory :semester do
    year { generate(:year) }
    term { generate(:term) }
  end
end
