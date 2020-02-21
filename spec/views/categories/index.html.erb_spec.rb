require "rails_helper"

RSpec.describe "categories/index" do

  context "with 2 categories" do
    before(:each) do
      assign(:categories, [
        Category.create!(:name => "slicer"),
        Category.create!(:name => "dicer")
      ])
    end

    it "displays both categories" do
      render

      expect(rendered).to match /slicer/
      expect(rendered).to match /dicer/
    end
  end
end