class Book < ApplicationRecord
  belongs_to :category
  max_paginates_per 10
  validates :name, presence: true, length: { maximum: 30 }
  validates :desc, presence: true

end
