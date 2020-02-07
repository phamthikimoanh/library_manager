class User < ApplicationRecord
    has_many :book_orders
end
