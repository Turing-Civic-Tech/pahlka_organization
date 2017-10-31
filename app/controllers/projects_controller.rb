class ProjectsController < ApplicationController
  def index
    response = GithubService.new(current_user.token, "Turing-Civic-Tech").get_org_repos
    @repositories = RepositoryService.new(response).repositories
  end

  def show
    @repository = project_params[:repo]
  end

  private

  def project_params
    params.permit(:repo)
  end
end
