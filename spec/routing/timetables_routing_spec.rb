require "rails_helper"

RSpec.describe TimetablesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/timetables").to route_to("timetables#index")
    end


    it "routes to #show" do
      expect(:get => "/timetables/1").to route_to("timetables#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/timetables").to route_to("timetables#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/timetables/1").to route_to("timetables#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/timetables/1").to route_to("timetables#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/timetables/1").to route_to("timetables#destroy", :id => "1")
    end

  end
end
