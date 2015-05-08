require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	context "#create" do
		it "redirects to the users profile" do
			post :create, user: FactoryGirl.attributes_for(:user)
			expect(response).to redirect_to user_path(User.last.id)
		end

		it "should not redirect with bad attributes" do
			post :create, user: {username: nil , password: "wdw"}
			expect(response).to redirect_to new_user_path
		end

	end
end
