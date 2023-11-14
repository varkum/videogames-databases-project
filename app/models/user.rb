class User < ApplicationRecord
  has_one :wishlist
  
  has_secure_password

  normalizes :email, with: -> email { email.strip.downcase }

  after_create :create_wishlist

  private
  
  def create_wishlist
    create_wishlist!
  end
end
