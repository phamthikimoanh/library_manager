class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books
  def username
    return self.email.split('@')[0].capitalize 
  end
  # validate :at_least_15

  # def at_least_15
  #   if self.birthday
  #     errors.add(:birthdate, "You must be 15 years or older.") if self.birthday > 15.years.ago.to_date
  #   end
  # end
end
