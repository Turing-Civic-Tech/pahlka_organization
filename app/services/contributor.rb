class Contributor
  attr_reader  :start_day,
               :added_this_week,
               :deleted_this_week,
               :commits_this_week,
               :photo

  def initialize(params)
    this_week = params["weeks"].first
    @start_day = DateTime.strptime(this_week["w"].to_s,'%s')
    @added_this_week = this_week["a"]
    @deleted_this_week = this_week["d"]
    @commits_this_week = this_week["c"]
    @photo = params["author"]["avatar_url"]
  end
end
