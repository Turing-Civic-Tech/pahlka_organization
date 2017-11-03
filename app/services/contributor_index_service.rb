class ContributorIndexService
    def initialize(hash_values)
      @repositories = hash_values.map { |params| Repository.new(params) }
    end
    @repositories.each do |repo|
      
    @contributors = hash_values.map { |params| Contributor.new(params) }

  end
end
