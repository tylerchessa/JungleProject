class User < ApplicationRecord
 validates :email, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :first_name, :last_name, presence: true
  validates :password, :password_confirmation, presence: true, :length => { :minimum => 6}
end

