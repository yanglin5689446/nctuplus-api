FactoryBot.define do
  factory :book do
    name { Faker::Book.title }
    isbn { Faker::Code.isbn }
    authors { Faker::Book.author }
    info { Faker::Lorem.paragraph }
    cover_image do
      Rack::Test::UploadedFile.new(
        Rails.root.join('spec', 'support', 'books', 'calculus.jpg'),
        'image/jpeg'
      )
    end
    preview_url { Faker::Internet.url }
    user { create(:user) }
    price { Faker::Number.between(0, 3000) }
    status { Faker::Number.between(0, 3) }
    view_count { 0 }
    contact_way { Faker::Internet.email }
  end
end
