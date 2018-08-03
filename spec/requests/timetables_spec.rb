require 'rails_helper'

RSpec.describe "Timetables", type: :request do
  describe "GET /timetables" do
    it "works! (now write some real specs)" do
      get timetables_path
      expect(response).to have_http_status(200)
    end
  end
end
