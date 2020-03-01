require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  FactoryBot.define do
    factory :user do
      id {1}
      name {'Oanh'}
      # email: 'hoangvy@gmail.com'
      # password: '1234Vi'
      phone {'0123456635'}
      birthday {'1996-04-23'}
      address {'123 Nguyễn Thị Minh Khai, phường 2, Quận 1'}
    end
  end

  context "PUT #update" do

    before(:each) do
      @user = build(:user)
    end
    describe "PUT 'update/:id'" do
      it "allows an user to be updated" do
        @attr = { name: 'OanhAnh', phone: '0123456635', birthday: '1996-04-27', address: '123 Nguyễn Thị Minh Khai, phường 2, Quận 1' }
        put :update_user, params: { id: @user.id, user: @attr}
        find('.feedbackLink').click
        expect(response).to have_http_status(:ok)
      end
    end
  end
end