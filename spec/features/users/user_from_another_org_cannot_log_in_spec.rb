require 'rails_helper'


feature "An authenticated user can view a repository page" do
  xit "shows their dashboard page" do
  visit github_login_path

  expect(current_path).to eq("/")
  expect(page).to have_content("You must be a part of the Turing-Civic-Tech GitHub
  organization to access this part of the site")
  end
end
