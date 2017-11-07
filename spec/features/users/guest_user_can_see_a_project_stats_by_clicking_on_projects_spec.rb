require 'rails_helper'

feature "A user can view projects" do
  it "shows project stats when visiting /repositories" do
  visit github_login_path

  click_on "REPOSITORIES"

  expect(page).to have_content("Ruby")
  expect(page).to have_content("This repo is a project management app to keep track of our group's projects.")
  expect(page).to have_link("View Details")
  end
end
