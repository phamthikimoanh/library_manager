class Category < ApplicationRecord
      has_many :books 
      validates_associated :books
      validates :name, presence: true,
                        length: { maximum: 30 }
      max_paginates_per 5

      # after_touch do |category|
      #       puts "You have touched an object"
      # end
end
