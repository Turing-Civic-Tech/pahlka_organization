class Contributor
  attr_reader  :total_commits,
               :start_day,
               :added_this_week,
               :deleted_this_week,
               :commits_this_week,
               :photo,
               :username

  def initialize(params)
    @total_commits = params["total"]
    this_week = params["weeks"].last
    @start_day = DateTime.strptime(this_week["w"].to_s,'%s').to_date.to_formatted_s(:short)
    @added_this_week = this_week["a"]
    @deleted_this_week = this_week["d"]
    @commits_this_week = this_week["c"]
    @photo = params["author"]["avatar_url"]
    @username = params["author"]["login"]
  end
end
