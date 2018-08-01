require "rails_helper"

RSpec.describe PermanentCoursesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/permanent_courses").to route_to("permanent_courses#index")
    end

    it "routes to #show" do
      expect(:get => "/permanent_courses/1").to route_to("permanent_courses#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/permanent_courses").to route_to("permanent_courses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/permanent_courses/1").to route_to("permanent_courses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/permanent_courses/1").to route_to("permanent_courses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/permanent_courses/1").to route_to("permanent_courses#destroy", :id => "1")
    end
  end
end
