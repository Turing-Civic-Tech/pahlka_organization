class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
   @current_user ||= User.find_by(uid: session[:uid])
  end
end
