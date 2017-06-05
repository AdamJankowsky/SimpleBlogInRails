class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  def current_user
    @current_user ||= User.find(session[:uid]) if session[:uid]
  end
  helper_method :is_admin?
  def is_admin?
    return current_user.name == 'administrator'
  end

  def authorize
    redirect_to '/login' unless current_user
  end
  def authorize_admin
    redirect_to '/' unless current_user and current_user.name == 'administrator'
  end
end
