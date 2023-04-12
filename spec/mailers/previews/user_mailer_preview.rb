# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    def order_confirmation
      UserMailer.with(user: User.first, order: Order.first).order_confirmation
  end
  
end
