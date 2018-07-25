FactoryBot.define do
  factory :bulletin do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    category { Faker::Number.between(0, 1) }
    begin_time { Faker::Time.between(30.days.ago, Date.today, :all) }
    end_time { Faker::Time.between(Date.today, 30.days.since, :all) }

    author_id { create(:user).id }
  end
end
