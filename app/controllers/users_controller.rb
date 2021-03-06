class UsersController < ApplicationController
  protect_from_forgery
  def new
    current_user
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:uid] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
