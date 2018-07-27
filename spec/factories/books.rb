FactoryBot.define do
  factory :book do
    name { Faker::Book.title }
    isbn { Faker::Code.isbn }
    authors { Faker::Book.author }
    info { Faker::Lorem.paragraph }
    cover_image_url { Faker::Internet.url }
    preview_url { Faker::Internet.url }
    user { create(:user) }
    price { Faker::Number.between(0, 3000) }
    status { Faker::Number.between(0, 3) }
    view_times { 0 }
  end
end
