class UserController < ApplicationController
  def show
    events = github_service.get_org_events
  end

  private

  def github_service
    @github_service ||= GithubService.new(current_user.token, "Turing-Civic-Tech", current_user.username)
  end
end
