FactoryBot.define do
  factory :users_event do
    user { create(:user) }
    event { create(:event) }
    status { 0 }
  end
end
