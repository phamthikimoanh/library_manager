class Book < ApplicationRecord
  belongs_to :category
  max_paginates_per 5
  validates :name, presence: true, length: { maximum: 30 }
  validates :desc, presence: true
  mount_uploader :image, ImageUploader

end
