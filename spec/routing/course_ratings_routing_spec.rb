require "rails_helper"

RSpec.describe CourseRatingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/course_ratings").to route_to("course_ratings#index")
    end


    it "routes to #show" do
      expect(:get => "/course_ratings/1").to route_to("course_ratings#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/course_ratings").to route_to("course_ratings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/course_ratings/1").to route_to("course_ratings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/course_ratings/1").to route_to("course_ratings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/course_ratings/1").to route_to("course_ratings#destroy", :id => "1")
    end

  end
end
