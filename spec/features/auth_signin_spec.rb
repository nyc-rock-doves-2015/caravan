require 'spec_helper'
feature "Auth" do
  context "signin" do
    scenario "A user can access the signin page" do
      visit signin_path
      expect(page).to have_content("Sign In")
      expect(page).to have_content("Name")
      expect(page).to have_content("Password")
    end
    scenario "A successful sign in redirects to the user profile" do
      User.create(name: "test_user",
                  password: "password",
                  password_confirmation: "password")
      visit signin_path
      fill_in "session[name]", :with => "test_user"
      fill_in "session[password]", :with => "password"
      click_on "login"
      expect(page).to have_content("test_user")
    end

  end
end