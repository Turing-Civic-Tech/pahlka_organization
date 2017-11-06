class ProjectsController < ApplicationController
  def index
  end

  def new
    @project = Project.new
  end

  def create
    Project.create(project_params)
    redirect_to projects_path
  end

  private

  def project_params
    params.require("project").permit("title", "description", "image_path", "github_link", "heroku_link")
  end
end
