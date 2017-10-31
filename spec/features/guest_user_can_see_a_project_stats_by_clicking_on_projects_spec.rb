require 'rails_helper'

feature "A guest user can view projects" do
  it "shows project stats when visiting /projects" do
  visit github_login_path

  visit projects_path

  expect(page).to have_content('Pahlka Projects')
  expect(page).to have_content('Pull Requests: 10')
  expect(page).to have_content('Commits: 5')
  expect(page).to have_content('Contributors: 1')
  end
end
