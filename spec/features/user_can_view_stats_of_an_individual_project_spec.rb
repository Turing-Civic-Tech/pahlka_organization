require 'rails_helper'

feature "An authenticated user can view a repository page" do
  it "shows their dashboard page" do
  visit github_login_path

  click_on "repositories"

  click_on "repo_1"

  expect(page).to have_content('Pull Requests: 1')
  expect(page).to have_content('Commits: 19')
  end
end
