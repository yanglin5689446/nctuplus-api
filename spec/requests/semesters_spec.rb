require 'rails_helper'

RSpec.describe "Semesters", type: :request do
  describe "GET /semesters" do
    it "works! (now write some real specs)" do
      get semesters_path
      expect(response).to have_http_status(200)
    end
  end
end
