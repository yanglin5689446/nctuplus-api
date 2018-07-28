FactoryBot.define do
  factory :event do
    event_type { 0 }
    title { Faker::Football.competition }
    organization { Faker::Company.name }
    location { Faker::Address.full_address }
    url { Faker::Internet.url }
    content { Faker::Lorem::paragraph }
    begin_time { Faker::Time.between(30.days.ago, 15.days.ago, :all) }
    end_time { Faker::Time.between(15.days.ago, 5.days.ago, :all) }
    user { create :user }
    view_count { 0 }
    cover_image {
      Rack::Test::UploadedFile.new(
        Rails.root.join('spec', 'support', 'events', 'nctuplus-banner.png'),
        'image/jpeg'
      )
    }
  end
end
