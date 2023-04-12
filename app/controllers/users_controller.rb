class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash.now.alert = "failed to sign up, try again."
      render :new
    end
  end   

  private 
  def user_params 
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :first_name, :last_name)
  end

end