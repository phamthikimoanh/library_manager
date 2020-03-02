# frozen_string_literal: true

class BookCardsGrid
  include Datagrid
  # Scope
  scope do
    BookCard
  end

  # Filters
  filter(:book_order_id, :string, :multiple => ",")
  # filter(:status, :boolean, default: false) 
  filter(:created_at, :datetime, :range => true, :default => proc { [1.month.ago.to_date, Time.now]})

  # Columns
  column(:id, mandatory: true)
  column(:book_id, mandatory: true)
  column(:name, mandatory: true)
  column(:price_borrow, mandatory: true)
  column(:book_order_id, mandatory: true)
  column(:status, :mandatory => true) do
    status? ? "Have paid" : "Not paid yet"
  end
  column(:created_at, mandatory: true)

  column(:actions, :html => true, :mandatory => true) do |record|
    #tự động vào trong view
    render :partial => "book_cards/book_card", :object => record
  end
end
