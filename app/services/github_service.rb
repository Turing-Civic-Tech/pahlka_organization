class GithubService
  def initialize(token, org, username = nil)
    @token = token
    @org = org
    @username = username
  end

  def request(api_path)
    if @token == "test"
      HTTParty.get("https://api.github.com/#{api_path}")
      .parsed_response
    else
      HTTParty.get("https://api.github.com/#{api_path}",
      :headers => {"Authorization" => "token #{@token}",
      "User-Agent" => "Turing-Civic-Tech"}).parsed_response
    end
  end

  def code_frequency(repo)
    request("repos/#{@org}/#{@repo}/stats/code_frequency")
  end

  def get_org_repos
    request("orgs/#{@org}/repos")
  end

  def get_repo_contributors(repo)
    request("repos/#{@org}/#{repo}/stats/contributors")
  end
  def get_repo_collaboraters(repo)
    request("repos/#{@org}/#{repo}/collaborators")
  end

  def get_repo_open_pull_requests(repo)
    request("repos/#{@org}/#{repo}/pulls")
  end

  def get_org_events
    request("orgs/github/events")
  end

  def part_of_org?
    if @token == "test"
      response = HTTParty.get("https://api.github.com/orgs/#{@org}/members/#{@username}")
    else
      response = HTTParty.get("https://api.github.com/orgs/#{@org}/members/#{@username}",
      :headers => {"Authorization" => "token #{@token}",
      "User-Agent" => "Turing-Civic-Tech"})
    end
    #if the API request returns with a 204 status code, that means success
    #if the person is not a member of the civic tech group, it will return with
    #a different code
    if response.code == 204
      true
    else
      false
    end
  end
end
