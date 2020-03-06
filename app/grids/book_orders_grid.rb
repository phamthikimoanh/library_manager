# frozen_string_literal: true

class BookOrdersGrid
  include Datagrid
  # Scope
  scope do
    BookOrder
  end
  # Filters
  filter(:id, :string, :multiple => ",")
  filter(:status, :xboolean) 
  filter(:user_id, :integer, :range => true) 
  filter(:created_at, :datetime, :range => true, :default => proc { [1.month.ago.to_date, Time.now]})

  # Columns
  column(:id, mandatory: true)
  column(:amount_book, mandatory: true)
  column(:created_at, mandatory: true)
  column(:user_id, mandatory: true)
  column(:status, :mandatory => true) do
    status? ? "√" : "X"
  end
  column(:actions, :html => true, :mandatory => true) do |record|
    #tự động vào trong view
    render :partial => "book_orders/book_order_action", :object => record
  end
end
