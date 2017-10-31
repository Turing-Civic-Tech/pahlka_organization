class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:uid] = @user.uid
    flash[:message] = "Welcome, #{current_user.username}"
    redirect_to @user
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
