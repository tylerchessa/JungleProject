class UserMailer < ApplicationMailer
    default from: 'no-reply@jungle.com'
  
    def order_confirmation
      order = params[:order]
      @line_items = LineItem.find_by(order_id: order.id)
      puts @line_items
      puts order.inspect
      @user = params[:user]
      mail(to: @user.email, subject: "Order #{order.id} has been received")
    end
end
