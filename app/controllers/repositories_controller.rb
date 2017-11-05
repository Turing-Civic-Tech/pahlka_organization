class RepositoriesController < ApplicationController
  def index
    response = github_service.get_org_repos
    @repositories = repository_service(response).repositories
  end

  def show
    @repo = project_params[:id]
    @pm = pm_service.pm_for_repo(@repo)
    @apm = pm_service.apm_for_repo(@repo)
    @users = User.all
    contributor_response = github_service.get_repo_contributors(@repo)
    @contributors = contributor_service(contributor_response).contributors
    @open_pull_requests = github_service.get_repo_open_pull_requests(@repo).count
  end

  private

  def pm_service
    @project_manager_service ||= ProjectManagerService.new
  end

  def contributor_service(response)
    @contributor_service ||= ContributorService.new(response)
  end

  def github_service
    @github_service ||= GithubService.new(current_user.token, "Turing-Civic-Tech", current_user.username)
  end


  def repository_service(response)
    @repository_service ||= RepositoryService.new(response)
  end

  def project_params
    params.permit(:id)
  end
end
