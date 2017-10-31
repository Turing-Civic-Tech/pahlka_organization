class ProjectsController < ApplicationController
  def index
    repos = GithubService.new(current_user.token, "Turing-Civic-Tech").get_org_repos
    repositories = RepositoryService.new(repos)
  end

end
