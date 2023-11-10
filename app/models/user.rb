class User < ApplicationRecord
  has_secure_password

  normalizes :email, with: -> email { email.strip.downcase }
end
