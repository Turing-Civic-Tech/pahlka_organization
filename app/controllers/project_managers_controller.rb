class ProjectManagersController < ApplicationController
  def remove_pm
    User.unassign_pm(repo_params[:repo_name])
    redirect_back(fallback_location: root_path)
  end

  def remove_apm
    User.unassign_apm(repo_params[:repo_name])
    redirect_back(fallback_location: root_path)
  end

  def update_pm
    User.unassign_apm(pm_params[:repo_name])
    User.assign_pm(pm_params)
    redirect_back(fallback_location: root_path)
  end

  def update_apm
    User.unassign_apm(pm_params[:repo_name])
    User.assign_apm(apm_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def repo_params
    params.permit(:repo_name)
  end

  def pm_params
    params.permit(:PM, :repo_name)
  end

  def apm_params
    params.permit(:APM, :repo_name)
  end
end
