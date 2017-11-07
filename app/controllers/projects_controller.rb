class ProjectsController < ApplicationController
  def index
    @accepted_projects = Project.accepted
    @projects_under_review = Project.under_review
    @proposed_projects = Project.proposed
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
