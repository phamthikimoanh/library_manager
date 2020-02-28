# frozen_string_literal: true

class BookCardsGrid
  include Datagrid
  # Scope
  scope do
    BookCard
  end
  # scope do
  #   BookCard.order("book_cards.created_at desc").joins(:group)
  # end
  # Filters
  filter(:book_order_id, :string, :multiple => ",")
  filter(:status, :boolean, default: false) 
  filter(:created_at, :datetime, :range => true, :default => proc { [24.hour.ago, Time.now]})

  # Columns
  column(:id, mandatory: true)
  column(:book_id, mandatory: true)
  # column(:name, mandatory: true)
  column(:price_borrow)
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
