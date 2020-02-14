# frozen_string_literal: true

class BookCard < ApplicationRecord
  belongs_to :book_order
  belongs_to :book
  # accepts_nested_attributes_for :books, :reject_if => :all_blank
end
