require 'rails_helper'

feature "A user can view top contributors for the overall" do
  it "shows project stats when visiting /repositories" do
  visit github_login_path

  click_on "CONTRIBUTOR RANKING"

  expect(page).to have_content(User.last.username)
  expect(page).to have_content(User.last.name)
  expect(page).to have_content(User.last.lines_added)
  expect(page).to have_content(User.last.lines_deleted)
  expect(page).to have_content(User.last.commits)
  end
end
