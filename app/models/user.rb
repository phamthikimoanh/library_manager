class User < ApplicationRecord
    has_many :books
    validates :name, presence: true, length: { minimum: 5 }
    validates :phone, presence: true,
                      numericality: true,
                      length: { :minimum => 10, :maximum => 15 }    
    validates :birthday, presence: true
    validates :address, presence: true, length: { minimum: 5 }
    # validates :image, presence: true, length: { minimum: 5 }
    mount_uploader :image, ImageUploader
end
