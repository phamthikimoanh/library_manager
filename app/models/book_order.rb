class BookOrder < ApplicationRecord
    belongs_to :user
    has_many :book_cards
    accepts_nested_attributes_for :book_cards, reject_if: :all_blank, allow_destroy: true
end
