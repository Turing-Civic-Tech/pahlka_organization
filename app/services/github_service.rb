class GithubService
  def initialize(token, owner, query = nil)
    @token = token
    @owner = owner
    @query = query
  end

  def request(api_path)
    HTTParty.get("https://api.github.com/#{api_path}",
    :headers => {"Authorization" => "token #{@token}",
    "User-Agent" => "Turing-Civic-Tech"}).parsed_response
    # :headers=>{"Authorization"=>"Token token=\"a8d8ce14d2402a2e1912c25f39df770b\""}
  end

  def code_frequency(repo)
    request("repos/#{@owner}/#{@repo}/stats/code_frequency")
  end

  def get_org_repos
    request("orgs/#{@owner}/repos")
  end

  def get_repo_contributors(repo)
    request("repos/#{@owner}/#{repo}/stats/contributors")
  end
  def get_repo_collaboraters(repo)
    request("repos/#{@owner}/#{repo}/collaborators")
  end

  def get_repo_open_pull_requests(repo)
    request("repos/#{@owner}/#{repo}/pulls")
  end
end
