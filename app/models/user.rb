class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books
  def username
    return self.email.split('@')[0].capitalize 
  end
  mount_uploader :image, ImageUploader
  validates :address, presence: true, length: { minimum: 5 }
  validates :phone, presence: true, length: { minimum: 1, maximun:10 }
  validate :at_least_15
  max_paginates_per 5

  def at_least_15
    if self.birthday
      errors.add(:birthdate, "You must be 15 years or older.") if self.birthday > 15.years.ago.to_date
    end
  end
end
