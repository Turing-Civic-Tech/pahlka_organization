class GithubService
  def initialize(token, query = nil)
    @token = token
    @query = query
  end

  def request(api_path, token)
    HTTParty.get("https://api.github.com/v3/#{api_path}",
    headers: { "Authorization" => "Bearer #{token}"}).parsed_response
  end
end


end
