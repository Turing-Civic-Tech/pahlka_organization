require 'rails_helper'

feature "A guest user can view projects" do
  it "shows project stats when visiting /projects" do

  visit projects_path

  expect(page).to have_content('Pahlka Projects')

  end
end
