require 'rails_helper'

feature "An authenticated user can view a repository page" do
  it "shows their dashboard page" do
  visit github_login_path

  click_on "REPOSITORIES"

  click_on "repo_1"

  expect(page).to have_content('Open Pull Requests:')
  expect(page).to have_content('Commits:')
  end
end
