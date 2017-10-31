class ContributorService
  attr_reader :contributors,
              :total

  def initialize(hash_values)
    @contributors = hash_values.map { |params| Contributor.new(params) }
  end
end
