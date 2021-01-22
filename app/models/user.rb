class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true 
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true
end

