# frozen_string_literal: true
require 'date'
class BookCard < ApplicationRecord
  belongs_to :book_order
  belongs_to :book
  max_paginates_per 5
  # validates :id, presence: true
  # validates :name, presence: true
end
