require 'rails_helper'

feature "A user can visit our portfolio and see projects" do
  it "and they see a button to pitch a new project" do

  visit '/'

  click_on "PROJECTS"
  
  expect(page).to have_link("New Project Pitch")

  click_on "New Project Pitch"

  fill_in "image_path", with: "BobHuggins.jpg"
  fill_in "project_title", with: "This is a Project Name"
  fill_in "project_description", with: "Some text that describes me. Some text that describes me. Some text that describes me.
    Some text that describes me. Some text that describes me. Some text that describes me."

  expect(page).to have_content('BobHuggins.jpg')
  expect(page).to have_content("Pahlka Organization App")
  expect(page).to have_content("This is a project in Ruby on Rails that is consuming the GitHub API.")
  end
end
