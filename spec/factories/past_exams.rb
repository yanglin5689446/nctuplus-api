FactoryBot.define do
  factory :past_exam do
    description { Faker::Lorem.sentence }
    download_count { 0 }
    file do
      Rack::Test::UploadedFile.new(
        Rails.root.join('spec', 'support', 'past_exams', 'past_exam.jpg'),
        'image/jpeg'
      )
    end
    uploader { create(:user) }
    course { create(:course) }
  end
end
