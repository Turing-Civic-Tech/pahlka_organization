class ProjectManagersController < ApplicationController
  def remove_pm
    pm_service.unassign_pm(repo_params[:repo_name])
    redirect_back(fallback_location: root_path)
  end

  def remove_apm
    pm_service.unassign_apm(repo_params[:repo_name])
    redirect_back(fallback_location: root_path)
  end

  def update_pm
    pm_service.unassign_apm(pm_params[:repo_name])
    pm_service.assign_pm(pm_params)
    redirect_back(fallback_location: root_path)
  end

  def update_apm
    pm_service.unassign_apm(pm_params[:repo_name])
    pm_service.assign_apm(apm_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def pm_service
    @project_manager_service ||= ProjectManagerService.new
  end

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
