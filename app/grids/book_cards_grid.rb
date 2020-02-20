# frozen_string_literal: true

class BookCardsGrid
  include Datagrid
  # Scope
  scope do
    BookCard
  end

  # Filters
  filter(:book_order_id, :string, :multiple => ",")
  filter(:status, :boolean)

  # Columns
  column(:id, mandatory: true)
  column(:book_id, mandatory: true)
  column(:name, mandatory: true)
  column(:price_borrow, mandatory: true)
  column(:book_order_id, mandatory: true)
  column(:status, :mandatory => true) do
    status? ? "Have paid" : "Not paid yet"
  end
  column(:actions, :html => true, :mandatory => true) do |record|
    #tự động vào trong view
    render :partial => "book_cards/book_card", :object => record
  end
end
