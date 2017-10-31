require 'rails_helper'

feature "An authenticated user can view their dashboard" do
  it "shows their dashboard page" do
  visit github_login_path

  click_on "repositories"

  click_on "repo_1"

  expect(page).to have_content('Pull Requests: 10')
  expect(page).to have_content('Commits: 5')
  expect(page).to have_content('Contributors: 1')
  end
end
