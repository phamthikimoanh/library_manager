# frozen_string_literal: true

class BookCard < ApplicationRecord
  belongs_to :book_order
  belongs_to :book
  max_paginates_per 5
  
  before_save :check_status

  def check_status
    status = 0
    if
  end
  
end
