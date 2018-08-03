require "rails_helper"

RSpec.describe PastExamsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/past_exams").to route_to("past_exams#index")
    end

    it "routes to #show" do
      expect(:get => "/past_exams/1").to route_to("past_exams#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/past_exams").to route_to("past_exams#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/past_exams/1").to route_to("past_exams#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/past_exams/1").to route_to("past_exams#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/past_exams/1").to route_to("past_exams#destroy", :id => "1")
    end
  end
end
