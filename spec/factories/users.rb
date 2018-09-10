FactoryBot.define do
  factory :user do
    name { Faker::Name.name.truncate(16) }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
    admission_year { Faker::Number.between(90, 120) }
    factory :test_user do
      name { :test }
      email { 'test@plus.nctu' }
      password { 'youshallnotpass' }
    end
    factory :admin_user do
      name { :admin }
      email { 'admin@plus.nctu' }
      password { 'superpowerfulpassword' }
      role { 1 }
    end
  end
end
