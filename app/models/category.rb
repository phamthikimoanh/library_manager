class Category < ApplicationRecord
      has_many :books 
      validates_associated :books
      validates :name, presence: true,
                    length: { maximum: 30 }
      max_paginates_per 10
end
