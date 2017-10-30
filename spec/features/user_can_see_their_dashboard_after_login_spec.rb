require 'rails_helper'

feature "An authenticated user can view their dashboard" do
  it "shows their dashboard page" do
  visit github_login_path

  expect(page).to have_content('User Dashboard')
  expect(page).to have_content('Welcome, Bob Huggins')
  expect(page).to have_css("#user_image")
  end
end
