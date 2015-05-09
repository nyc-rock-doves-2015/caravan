require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before :each do
    @testuser = User.create(username: "Charles", password: "password")
    session[:user_id] = @testuser.id
  end

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

  describe "#show" do
    pending "sets @user to current_user" do
      get :show, id: @testuser.id
      expect(@user).to eq @testuser
    end
    pending "renders the show template" do
      get :show
      expect(response).to redirect_to
    end
  end

  describe "#current" do
    it "sets @user to current_user" do
      get :current, current_user: @testuser
      expect(@user).to eq @testuser
    end
    it "renders the show template" do
    	get :current, current_user: @testuser
    	expect(response).to to render_template :new
    end
  end

end
