require 'rails_helper'

RSpec.describe User, type: :model do
  context "create user" do
    it "has a valid factory" do
      FactoryBot.build(:user).should be_valid
    end
    it "is invalid without a name" do
      FactoryBot.build(:user, name: nil).should_not be_valid
    end
    # it "returns a user name as a string" do
    #   user = FactoryBot(:user, name: "KimOanh")
    #   user.name.should == "KimOanh"
    # end
  end
end
