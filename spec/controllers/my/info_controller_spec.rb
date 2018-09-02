require 'rails_helper'

RSpec.describe My::InfoController, type: :controller do
  let(:current_user) { FactoryBot.create :user }
  before(:each) do
    request.headers.merge! current_user.create_new_auth_token
  end

  describe 'GET #books' do
    it 'returns a success response' do
      get :books, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #events' do
    it 'returns a success response' do
      get :events, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #past_exams' do
    it 'returns a success response' do
      get :past_exams, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #courses' do
    it 'returns a success response' do
      get :courses, params: {}
      expect(response).to be_successful
    end
  end
end
