class ContributorIndexService
    def initialize(github_service)
      @repositories_hash = github_service.get_org_repos
      @repositories = @repositories_hash.map { |params| Repository.new(params) }

    end
    # @repositories.each do |repo|
    #   @contributors = hash_values.map { |params| Contributor.new(params) }
    # end
    def contibutors_for_all_repos
      @repositories.each do |repo|
        github_service.get_repo_contributors(repo)
    end
  end
end
