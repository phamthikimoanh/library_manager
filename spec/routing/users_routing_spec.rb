require "rails_helper"

RSpec.describe UsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get("/user/edit")).to route_to("users#edit")
    end

    it "routes to #update" do
      expect(patch("/user/update_user")).to route_to("users#update_user")
    end
  end
end
