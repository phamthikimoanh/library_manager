require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  FactoryBot.define do
    factory :category do |f|
      f.name { 'Sach cong dan hoc' }
    end
  end
  describe "GET #index" do
    it "returns a success response" do
      @category = FactoryBot.build(:category, name: 'Sach dia ly hoc')
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Category" do
        post :create, :params => { :category => { :name => 'Any Name' } }
        expect(response.content_type).to eq "text/html"
      end
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      @category = FactoryBot.create(:category, name: 'Sach cong nhan hoc')
      get :show, params: {id: @category.to_param}
      expect(response).to be_successful
    end
  end
end
