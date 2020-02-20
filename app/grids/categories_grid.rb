# frozen_string_literal: true

class CategoriesGrid
  include Datagrid
  # Scope
  scope do
    Category
  end

  # Filter
  filter(:id, :string)
  filter(:name, :string)

  # Columns
  column(:id, mandatory: true)
  column(:name, mandatory: true)
  column(:actions, html: true, mandatory: true) do |record|
    # tự động vào trong view
    render partial: "categories/category", object: record
  end
end
