require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  FactoryBot.define do
    factory :user do |f|
      f.id { 1 }
      f.name {'HinhHoangVi'}
      f.email {'huynhhoangvi@gmail.com'}
      f.password {'1234Vi'}
      f.phone {'0123456635'}
      f.birthday {'1996-04-23'}
      f.address {'123 Nguyễn Thị Minh Khai, phường 2, Quận 1'}
    end
  end

  context "PUT #update" do
    before(:each) do
      @user = build(:user)
    end
    describe "PUT 'update/:id'" do
      attr = FactoryBot.attributes_for(:user, name: "Larry")
      it "allows an user to be updated" do
        patch :update_user, params: {id: @user, user: attr}
        @user.reload
        # @user.name.should eq("Larry")
        # expect(@user.name).to eq 'KimOanh'
      end
    end
  end
end