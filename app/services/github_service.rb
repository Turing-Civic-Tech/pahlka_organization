class GithubService
  def initialize(token, owner, query = nil)
    @token = token
    @owner = owner
    @query = query
  end

  def request(api_path, token)
    HTTParty.get("https://api.github.com/#{api_path}",
    :access_token => @token).parsed_response
  end

  def get_org_repos
    request("orgs/#{@owner}/repos", @token)
  end

  def get_repo_contributors(repo)
    request("/repos/#{@owner}/#{repo}/stats/contributors")
  end

  def get_repo_collaboraters(repo)
    request("/repos/#{@owner}/#{repo}/collaborators")
  end

  def get_repo_open_pull_requests(owner, repo)
    request("/repos/#{owner}/#{repo}/pulls")
  end
end
