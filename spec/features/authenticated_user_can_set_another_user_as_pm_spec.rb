require 'rails_helper'

feature "An authenticated user can view their dashboard" do
  it "shows their dashboard page and lets them update PM and APM" do
  visit github_login_path

  click_on "repositories"

  click_on "repo_1"
  save_and_open_page
  expect(page).to have_button('Set PM')
  expect(page).to have_button('Set APM')

  select("Bob Huggins", from: "PM").select_option
  click_on "set_pm"

  expect(page).to have_content('Project Manager: Bob Huggins')

  select("Bob Huggins", from: "APM").select_option
  click_on "set_apm"

  expect(page).to have_content('Assistant Project Manager: Bob Huggins')
  end
end
