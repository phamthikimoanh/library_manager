# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :book_cards
  validates :name, presence: true, length: { maximum: 100 }
  validates :desc, presence: true, length: { minimum: 30 }
  validates :author, presence: true, length: { maximum: 50 }
  validates :books_total, presence: true, numericality: { only_integer: true }
  validates :price, presence: true
  validates :books_total, presence: true, numericality: { only_integer: true }
  validates :status, inclusion: { in: [true, false] }
  mount_uploader :image, PictureUploader

  max_paginates_per 5
end
