# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :category
  validates_associated :category
  has_many :book_cards
  max_paginates_per 5
  # validates :name, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, presence: true, length: { maximum: 30 }
  # validates :desc, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, presence: true, length: { minimum: 30 }
  # validates :author, format: { with: /[a-zA-Z]/ }, presence: true, length: { maximum: 25 }
  # validates :books_total, presence: true, numericality: { only_integer: true }
  # validates :price, presence: true, numericality: true
  # validates :books_total, presence: true, numericality: { only_integer: true }
  # validates :status, inclusion: { in: [true, false] }
end
