class UserController < ApplicationController
  def show
    events = github_service.get_org_events
  end

  def index
    contributor_index_service.create_statistics_for_all_users
    @users = User.all
  end

  def commits_chart
    @commit_data = contributor_index_service.commit_data_for_chart
  end

  def additions_chart
    @additons_deletions_data = contributor_index_service.added_and_deleted_for_chart
  end

  private

  def github_service
    @github_service ||= GithubService.new(current_user.token, "Turing-Civic-Tech", current_user.username)
  end

  def contributor_index_service
    ContributorIndexService.new(github_service)
  end
end
