require 'rails_helper'

RSpec.describe "Bulletins", type: :request do
  describe "GET /bulletins" do
    it "works! (now write some real specs)" do
      get bulletins_path
      expect(response).to have_http_status(200)
    end
  end
end
