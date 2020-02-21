require "rails_helper"

RSpec.describe CategoriesController, type: :controller do
  context "GET #index" do
    it "return a success respone" do
      get :index
      expect(response).to be_success
    end
    context "GET #edit" do
      it "edit category" do
        category = Category.create!(name: "Sach tin hoc")
        get :edit, params: { id: category.to_param }
        expect(response).to be_success
      end
    end
  end
end
