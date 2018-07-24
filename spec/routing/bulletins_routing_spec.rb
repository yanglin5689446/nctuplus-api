require "rails_helper"

RSpec.describe BulletinsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/bulletins").to route_to("bulletins#index")
    end

    it "routes to #show" do
      expect(:get => "/bulletins/1").to route_to("bulletins#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/bulletins").to route_to("bulletins#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/bulletins/1").to route_to("bulletins#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/bulletins/1").to route_to("bulletins#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/bulletins/1").to route_to("bulletins#destroy", :id => "1")
    end
  end
end
