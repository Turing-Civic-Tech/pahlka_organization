class User < ApplicationRecord
  has_many :user_stats
  after_create  :create_stats

  def create_stats
    user_stats.create(
      lines_added: 0,
      lines_deleted: 0,
      commits: 0
    )
  end

  def commits
    user_stats.first.commits
  end

  def lines_added
    user_stats.first.lines_added
  end

  def lines_deleted
    user_stats.first.lines_deleted
  end

  def self.find_or_create_from_auth_hash(auth_hash)
    username = auth_hash["info"]["nickname"]
    token = auth_hash["credentials"]["token"]
    org = "Turing-Civic-Tech"
    if part_of_org?(username, token, org)
      uid = auth_hash["uid"]
      name = auth_hash["info"]["name"]
      email = auth_hash["info"]["email"]
      image = auth_hash["info"]["image"]
      token = auth_hash["credentials"]["token"]
      user = find_or_create_by(
        username: username,
      )
      user.update(
            uid: uid,
            name: name,
            image_path: image,
            email: email,
            token: token
      )
      user
    else
      false
    end
  end

  def self.part_of_org?(username, token, org)
    GithubService.new(token, org, username).part_of_org?
  end

  #extract to PM service

  def self.unassign_pm(repo)
    user = self.find_by(role: "PM", repository_name: repo)
    if user
      user.update!(role: nil, repository_name: nil)
    end
  end

  def self.unassign_apm(repo)
    user = self.find_by(role: "APM", repository_name: repo)
    if user
      user.update!(role: nil, repository_name: nil)
    end
  end

  def self.assign_pm(params)
    update(params[:PM],
       role: "PM",
       repository_name: params[:repo_name]
          )
  end

  def self.assign_apm(params)
    update(params[:APM],
       role: "APM",
       repository_name: params[:repo_name]
          )
  end

  def self.placeholder
    User.new(username: "Bob Huggins", image_path: "BobHuggins.jpg")
  end

  def self.pm_for_repo(repo)
    find_by(role: "PM", repository_name: repo) || placeholder
  end

  def self.apm_for_repo(repo)
    find_by(role: "APM", repository_name: repo) || placeholder
  end
end
