class RepositoriesController < ApplicationController
  def index
    response = GithubService.new(current_user.token, "Turing-Civic-Tech").get_org_repos
    @repositories = RepositoryService.new(response).repositories
  end

  def show
    repo = project_params[:id]
    service = GithubService.new(current_user.token, "Turing-Civic-Tech")
    contributors_response = service.get_repo_contributors(repo)
    contributor_service = ContributorService.new(contributors_response)
    @total = contributor_service.total
    @contributors = contributor_service.contributors
    @open_pull_requests = service.get_repo_open_pull_requests(repo).count
  end

  private

  def project_params
    params.permit(:id)
  end
end
