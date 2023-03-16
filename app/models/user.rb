class User < ApplicationRecord

  validates :password, presence: true, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: true
  
  has_secure_password
  
end
