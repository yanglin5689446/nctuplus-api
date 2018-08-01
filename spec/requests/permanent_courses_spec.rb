require 'rails_helper'

RSpec.describe "PermanentCourses", type: :request do
  describe "GET /permanent_courses" do
    it "works! (now write some real specs)" do
      get permanent_courses_path
      expect(response).to have_http_status(200)
    end
  end
end
