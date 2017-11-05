class UserController < ApplicationController
  def show
    events = github_service.get_org_events
  end

  def index
    generate_graph_data
    @users = User.all
  end

  def commits_chart
    @commit_data = GraphDatum.first.commits
  end

  def additions_chart
    @additons_deletions_data = GraphDatum.first.add_delete
  end

  private

  def generate_graph_data
    if !(GraphDatum.first) || (Time.now - 1.hour) > GraphDatum.first.updated_at
      GraphInfoJob.perform_later(current_user.token, "Turing-Civic-Tech", current_user.username)
    end
  end

  def github_service
    @github_service ||= GithubService.new(current_user.token, "Turing-Civic-Tech", current_user.username)
  end

  def contributor_index_service
    ContributorIndexService.new(github_service)
  end
end
