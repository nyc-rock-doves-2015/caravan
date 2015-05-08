require 'spec_helper'
feature "Auth" do
  scenario "A user can access the signin page" do
    visit signin_path
    expect(page).to have_content("Sign In")
    expect(page).to have_content("Name")
    expect(page).to have_content("Password")
  end
end