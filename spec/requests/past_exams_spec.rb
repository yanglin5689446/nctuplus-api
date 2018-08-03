require 'rails_helper'

RSpec.describe "PastExams", type: :request do
  describe "GET /past_exams" do
    it "works! (now write some real specs)" do
      get past_exams_path
      expect(response).to have_http_status(200)
    end
  end
end
