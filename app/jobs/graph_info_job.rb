class GraphInfoJob < ActiveJob::Base
  queue_as :default

  def perform(token, org, username)
    if (Time.now - 1.hour) > GraphDatum.first.updated_at
      github_service = GithubService.new(token, org, username)
      contrib_service = ContributorIndexService.new(github_service)
      contrib_service.create_statistics_for_all_users
      contrib_service.create_added_and_deleted_for_chart
      contrib_service.create_commit_data_for_chart
    end
  end
end
