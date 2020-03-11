require 'rails_helper'

RSpec.describe User, type: :model do
  FactoryBot.define do
    factory :user do |f|
      f.id { 4 }
      f.name { 'Kim Oanh' }
      f.email { 'phamthikimoanh@gmail.com' }
      f.password { '1234Vi' }
      f.phone { '0123456635' }
      f.birthday { '1996-04-26' }
      f.address { '126Nguyễn Thị Minh Khai, phường 2, Quận 1' }
    end
  end

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
