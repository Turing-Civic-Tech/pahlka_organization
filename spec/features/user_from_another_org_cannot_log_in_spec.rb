require 'rails_helper'


feature "An authenticated user can view a repository page" do
  it "shows their dashboard page" do
  OmniAuth.config.mock_auth[:github] = {
   "uid" => '3482342',
   "info" => {
     "name" => 'Bob Huggins',
     "email" => 'Bobby@thegmails.com',
     "image" => 'BobHuggins.jpg'
   },
   "credentials" => {
     "token" => "test"
   },
   "extra" => {
     "raw_info" => {
       "organizations_url" => "https://api.github.com/users/otheruser/orgs"
     }
   }
  }

  visit github_login_path

  expect(current_path).to eq("/")
  expect(page).to have_content("You must be a part of the Turing-Civic-Tech GitHub
  organization to access this part of the site")
  end
end
