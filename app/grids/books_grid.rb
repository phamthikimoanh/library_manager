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
  filter(:status, :boolean)

  # Columns
  column(:id, mandatory: true)
  column(:isbn, mandatory: true)
  column(:name, mandatory: true)
  column(:desc, mandatory: true)
  column(:books_total, mandatory: true) 
  column(:price, mandatory: true) 
  column(:status, :mandatory => true) do
    status? ? "Yes" : "No"
  end
  column(:actions, :html => true, :mandatory => true) do |record|
    #tự động vào trong view
     render :partial => "books/book", :object => record
  end
end
