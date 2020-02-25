# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :book_cards
  validates :name, format: {with: /[a-zA-Z]/}, presence: true, length: { maximum: 30 }
  validates :desc, format: {with: /[a-zA-Z]/}, presence: true, presence: true, length: { minimum: 30 }
  validates :author, format: { with: /[a-zA-Z]/ }, presence: true, length: { maximum: 25 }
  validates :books_total, presence: true, numericality: { only_integer: true }
  validates :price, presence: true
  validates :books_total, presence: true, numericality: { only_integer: true }
  validates :status, inclusion: { in: [true, false] }
  max_paginates_per 5

  # validate :book_stock

  # def _book_stock
    
  #   if books_total > 0
  #     status = 1
  #   else
  #     status = 0
  #   end
    
  #   binding.pry
    
  # end

end
