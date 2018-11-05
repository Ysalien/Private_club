class User < ApplicationRecord
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name, presence: true #Test : first_name can't be blank
  validates :last_name, presence: true #Test : last_name can't be blank
  validates :email, presence: true, length: { maximum: 255 }, #Test : email can't be blank
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false } #Test : email already taken or not
  has_secure_password # password_digest
  validates :password, presence: true, length: { minimum: 6 } #Test : password can't be blank
end
