require "rails_helper"

RSpec.describe "categories/index" do

  context "with 2 categories" do
    before(:each) do
      assign(:categories, [
        Category.create!(:name => "Sách Tin"),
        Category.create!(:name => "Sách Hóa")
      ])
    end

    it "displays both categories" do
      render

      expect(rendered).to match /Sách Tin/
      expect(rendered).to match /Sách Hóa/
    end
  end
end
#  1) categories/index with 2 categories displays both categories
#  Failure/Error: Total category: #{@categories_grid.assets.total_count}