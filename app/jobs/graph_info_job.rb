class GraphInfoJob < ActiveJob::Base
  queue_as :default

  def perform(github_service)
    contrib_service = ContributorIndexService.new(github_service)
    contrib_service.create_statistics_for_all_users
  end
end
