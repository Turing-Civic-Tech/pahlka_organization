class RepositoryService
  def initialize(hash_values)
    @repositories = hash_values.map { |params| Repository.new(params) }
  end
end
