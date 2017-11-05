class ContributorService
  attr_reader :contributors,
              :total

  def initialize(hash_values)
    @contributors = hash_values.map { |params| Contributor.new(params) }
  end

  def contributors_sorted_by_commits
    @contributors.sort_by {|obj| obj.commits_this_week}.reverse
  end
end
