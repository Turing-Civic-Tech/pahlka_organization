class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    if @user
      session[:uid] = @user.uid
      flash[:message] = "Welcome, #{current_user.username}"
      redirect_to @user
    else
      flash[:message] = "You must be a part of the Turing-Civic-Tech GitHub
      organization to access this part of the site"
    end
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
