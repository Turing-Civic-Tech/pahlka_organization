class HomeController < ApplicationController
  def index
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
