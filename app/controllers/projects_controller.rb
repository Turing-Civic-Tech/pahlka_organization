class ProjectsController < ApplicationController
  def index
    @accepted_projects = Project.accepted
    @projects_under_review = Project.under_review
    @proposed_projects = Project.proposed
    @project = Project.new
  end

  def create
    image_path = Project.handle_image_upload(image_param["image_path"])
    project = Project.create(project_params)
    project.update(image_path: image_path)
    redirect_to projects_path
  end

  def update
    @project = Project.update(project_params)
    redirect_to projects_path
  end

  def edit
    @project = Project.find(params[:id])
  end

  def destroy
    Project.destroy(params[:id])
    redirect_to projects_path
  end

  def accept
    Project.update(params[:id], status: "Accepted")
    redirect_to projects_path
  end

  def review
    Project.update(params[:id], status: "Under_review")
    redirect_to projects_path
  end

  private

  def project_params
    params.require("project").permit("title", "description", "github_link", "heroku_link")
  end

  def image_param
    params.require("project").permit("image_path")
  end
end
