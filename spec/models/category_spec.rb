require "rails_helper"

RSpec.describe Category, type: :model do
  context "validation tests" do
    it "ensures name presence" do
      category = Category.new(name: "Sach ao thuat").save
      expect(category).to eq(true)
    end
    it "is valid with a name" do
      category = Category.new(name: 1234).save
      expect(category).to eq(false)
    end

    it "should save successfuly" do
      category = Category.new(name: "Sach khoa hoc").save
      expect(category).to eq(true)
    end
  end

end
