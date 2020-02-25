class User < ApplicationRecord
  has_many :books
  validates :name, presence: true, length: { minimum: 5 }
  # validates :phone, presence: true,
  #                   numericality: true,
  #                   length: { :minimum => 10, :maximum => 15 }
  validates :address, presence: true, length: { minimum: 5 }
  validates :phone, presence: true, length: { minimum: 1, maximun:10 }
  mount_uploader :image, ImageUploader
  validate :at_least_15
    max_paginates_per 5

  def at_least_15
    if self.birthday
      errors.add(:birthdate, "You must be 15 years or older.") if self.birthday > 15.years.ago.to_date
    end
  end
end
