# frozen_string_literal: true

class BooksGrid
  include Datagrid
  # Scope
  scope do
    Book
  end

  # Filters
  filter(:isbn, :string)
  filter(:name, :string)
  filter(:author, :string)
  filter(:status, :xboolean)

  # Columns
  column(:id, mandatory: true)
  column(:isbn, mandatory: true)
  column(:image, :html => true, :mandatory => true) do |book|
      image_tag("#{book.image}", title: "image", style: "max-height: 30px; max-width: 20px")
  end
  column(:name, mandatory: true)
  column(:books_total, mandatory: true)
  column(:price, mandatory: true)
  column(:status, :mandatory => true) do
    status? ? "Stocking" : "Out of stock"
  end
  column(:actions, :html => true, :mandatory => true) do |record|
    #tự động vào trong view
    render :partial => "books/book", :object => record
  end
end
