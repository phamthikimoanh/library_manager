require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before(:each) {  
      skip("Add a hash of attributes invalid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let!(:valid_session) { {name: 'oanh', phone: '0123456635', birthday: '1996-04-23', address: '123 Nguyễn Thị Minh Khai, phường 2, Quận 1'} }
  
  describe "GET #index" do
    it "returns a 200 OK status" do
      User.create! valid_attributes
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
  describe "GET #edit" do
    it "returns a success response" do
      user = User.create!({name: 'oanh', email: 'kimoanh12@gmail.com', password: '1234Oanh', phone: '0123456635', birthday: '1996-04-23', address: '123 Nguyễn Thị Minh Khai, phường 2, Quận 1'})
      get :edit, params: {id: user.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end
  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: 'oanh', phone: '0123456635', birthday: '1996-04-23', address: '123 Nguyễn Thị Minh Khai, phường 2, Quận 1'} 
      }

      it "updates the requested user" do
        user = User.create! valid_attributes
        put :update, params: {id: user.to_param, user: new_attributes}, session: valid_session
        user.reload
        skip("Add assertions for updated state")
      end

      # it "redirects to the user" do
      #   user = User.create! valid_attributes
      #   put :update, params: {id: user.to_param, user: valid_attributes}, session: valid_session
      #   expect(response).to redirect_to(user)
      # end
    end
  end
end
