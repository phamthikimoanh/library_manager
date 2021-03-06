class Category < ApplicationRecord
    has_many :books 
    validates :name, presence: true, format: {with: /[a-zA-Z]/}, length: { maximum: 30 }
    max_paginates_per 5
end
