require 'rails_helper'

feature "An authenticated user can view their dashboard" do
  it "shows their dashboard page" do
  visit github_login_path

  expect(page).to have_content('User Dashboard')
  end
end
