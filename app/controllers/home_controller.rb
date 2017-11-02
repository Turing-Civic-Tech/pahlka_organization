class HomeController < ApplicationController
  def index
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
