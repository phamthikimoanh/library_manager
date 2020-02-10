class Book < ApplicationRecord
  belongs_to :category
  max_paginates_per 10
end
