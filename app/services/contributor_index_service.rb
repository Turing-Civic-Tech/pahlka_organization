class ContributorIndexService
  def initialize(github_service)
    @github_service = github_service
    @repositories_hash = github_service.get_org_repos
    @repositories = @repositories_hash.map { |params| Repository.new(params) }

  end

  def contributors_for_all_repos
  all_contributors = []
    @repositories.each do |repo|
      params = @github_service.get_repo_contributors(repo.name)
      contributors = ContributorService.new(params).contributors
        contributors.each do |contributor|
          all_contributors << contributor
      end
    end
    all_contributors
  end

  def reset_user_statistics
    contributors_for_all_repos.each do |contributor|
      user = User.find_or_create_by(username: contributor.username)
        user.user_stats.destroy_all
        user.user_stats.create(
            lines_added: 0,
            lines_deleted: 0,
            commits: 0
          )
    end
  end

  def create_statistics_for_all_users
    reset_user_statistics
    contributors_for_all_repos.each do |contributor|
      user = User.find_or_create_by(username: contributor.username)
      user.user_stats.first.increment!(:lines_added, contributor.added_this_week)
      user.user_stats.first.increment!(:lines_deleted, contributor.deleted_this_week)
      user.user_stats.first.increment!(:commits, contributor.commits_this_week)
    end
  end

  def users_and_commits
    User
    .joins(:user_stats)
    .select('commits AS user_commits,

       users.username')
    .order('user_commits DESC')
  end

  def users_and_additons_and_deletions
    User
    .joins(:user_stats)
    .select('lines_added AS user_lines_added,
         lines_deleted AS user_lines_deleted,
         users.username')
    .order('user_lines_added DESC')
  end

  def added_and_deleted_for_chart
    array = []
    array << ["Contributor", "Additions", "Deletions"]
    users_and_additons_and_deletions.map do |user|
      nested_array = []
      nested_array << user.username.to_s << user.user_lines_added.to_i << user.user_lines_deleted.to_i
      array << nested_array
    end
    array.to_json
  end


  def commit_data_for_chart
    array = []
    array << ["Contributor", "Commits"]
    users_and_commits.map do |user|
      nested_array = []
      nested_array << user.username.to_s << user.user_commits.to_i
      array << nested_array
    end
    array.to_json
  end
end
