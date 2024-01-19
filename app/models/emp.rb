class Emp < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Invalid email format" }
    validates :contact, presence: true, length: { minimum: 10, maximum: 15 }
    validates :address, presence: true
end
