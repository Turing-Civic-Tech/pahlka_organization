class ContributorIndexService
  def initialize(github_service)
    @github_service = github_service
    @repositories_hash = github_service.get_org_repos
    @repositories = @repositories_hash.map { |params| Repository.new(params) }

  end

  def contributors_for_all_repos
  reset_user_statistics
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
    contributors_for_all_repos.each do |contributor|
      user = User.find_or_create_by(username: contributor.username)
      user.user_stats.first.increment!(:lines_added, contributor.added_this_week)
      user.user_stats.first.increment!(:lines_deleted, contributor.deleted_this_week)
      user.user_stats.first.increment!(:commits, contributor.commits_this_week)
    end
  end
end
