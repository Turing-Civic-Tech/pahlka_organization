require 'rails_helper'

feature "An authenticated user can view their dashboard" do
  xit "shows their dashboard page" do
  visit github_login_path

  click_on "repositories"

  click_on "repo_1"

  expect(page).to have_button('Set PM')
  expect(page).to have_button('Set APM')

  select("Brandon Stewart", from: "Set PM").select_option

#   From the project show page
# I should see the two project managers who are assigned to a particular project
# I should see their portrait and name
# Below their portrait and name
# I should see a button to add/modify the PM and APM
# When I click on the button to add/modify the PM/APM I
# should see a dropdown of all of the members of the posse
#  to select from.

  end
end
