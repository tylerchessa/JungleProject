class User < ApplicationRecord
  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.downcase.strip)
    if user && user.authenticate(password)
      user
    else nil
  end
end
 validates :email, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :first_name, :last_name, presence: true
  validates :password, :password_confirmation, presence: true, :length => { :minimum => 6}
end

