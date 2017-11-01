class ProjectManagersController < ApplicationController
  def update_pm
    User.unassign_apm(repo_name)
    User.assign_pm(pm_params)
    redirect_back(fallback_location: root_path)
  end

  def update_apm
    User.unassign_apm(repo_name)
    User.assign_apm(apm_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def repo_name
    params.permit(:repo_name).to_s
  end

  def pm_params
    params.permit(:PM, :repo_name)
  end

  def apm_params
    params.permit(:APM, :repo_name)
  end
end
