require 'rails_helper'

feature "A user can visit our portfolio and see projects" do
  it "shows them an overview of all projects when they visit the projects page" do
  visit '/'

  click_on "PROJECTS"

  expect(page).to have_content('pahlka_org.jpg')
  expect(page).to have_content("Pahlka Organization App")
  expect(page).to have_content("This is a project in Ruby on Rails that is consuming the GitHub API.")
  end
end
