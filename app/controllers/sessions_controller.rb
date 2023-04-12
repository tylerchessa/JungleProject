class SessionsController < ApplicationController

  def new
    # No need for anything in here, we are just going to render our
    # new.html.erb AKA the login page
  end

  def create
    # Look up User in db by the email address submitted to the login form and
    # convert to lowercase to match email in db in case they had caps lock on:
      user = User.authenticate_with_credentials(params[:login][:email], params[:login][:password])
      if user
      session[:user_id] = user.id.to_s
      redirect_to root_path, notice: 'Successfully logged in!'
      else
      flash.now.alert = "Incorrect email or password, try again."
      render :new
      end
    end
    # Verify user exists in db and run has_secure_password's .authenticate() 
    # method to see if the password submitted on the login form was correct: 

#     user = User.find_by(email: params[:login][:email].downcase)
#     if user && user.authenticate(params[:login][:password]) 
#       session[:user_id] = user.id.to_s
#       redirect_to root_path, notice: 'Successfully logged in!'
#     else
#       flash.now.alert = "Incorrect email or password, try again."
#       render :new
#     end
# end


def destroy
  # delete the saved user_id key/value from the cookie:
  session.delete(:user_id)
  redirect_to login_path, notice: "Logged out!"
end
end