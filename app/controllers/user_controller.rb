class UserController < ApplicationController
  def show
    flash[:message] = "Welcome, #{current_user.username}"
  end
end
