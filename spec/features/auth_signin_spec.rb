require 'spec_helper'
RSpec.feature "User Sign Up", :type => :feature do
  scenario "A user can access the signin page" do
    visit signin_path
    expect(page).to have_content("Sign In")
    expect(page).to have_content("Name")
    expect(page).to have_content("Password")
  end