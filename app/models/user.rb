class User < ApplicationRecord

  validates :password, length: { minimum: 6 }

  has_secure_password
  
end
