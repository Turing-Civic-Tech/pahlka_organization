class ProjectManagerService
  def unassign_pm(repo)
    user = User.find_by(role: "PM", repository_name: repo)
    if user
      user.update!(role: nil, repository_name: nil)
    end
  end

  def unassign_apm(repo)
    user = User.find_by(role: "APM", repository_name: repo)
    if user
      user.update!(role: nil, repository_name: nil)
    end
  end

  def assign_pm(params)
    User.update(params[:PM],
       role: "PM",
       repository_name: params[:repo_name]
          )
  end

  def assign_apm(params)
    User.update(params[:APM],
       role: "APM",
       repository_name: params[:repo_name]
          )
  end

  def placeholder
    User.new(name: "Bob Huggins", image_path: "BobHuggins.jpg")
  end

  def pm_for_repo(repo)
    User.find_by(role: "PM", repository_name: repo) || placeholder
  end

  def apm_for_repo(repo)
    User.find_by(role: "APM", repository_name: repo) || placeholder
  end
end
