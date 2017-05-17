class ApplicationController < ActionController::Base
  # protect_from_forgery
  helper_method :current_user
  def current_user
    @current_user ||= User.find(session[:uid]) if session[:uid]
  end
  def authorize
    redirect_to '/login' unless current_user
  end
end
