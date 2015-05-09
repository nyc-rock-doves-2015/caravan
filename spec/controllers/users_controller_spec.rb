require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before :each do
    @testuser = User.create(username: "Charles", password: "password")
    session[:user_id] = @testuser.id
  end

  describe "#new" do
  	it "renders the :new view" do
  		get :new
  		expect(response).to render_template :new
  	end
  end

  context "#create" do
    it "redirects to the users profile" do
      post :create, user: FactoryGirl.attributes_for(:user)
      expect(response).to redirect_to user_path(User.last.id)
    end

    it "does not redirect with bad attributes" do
      post :create, user: {username: nil , password: "wdw"}
      expect(response).to redirect_to new_user_path
    end
  end

  describe "#show" do
    # pending "sets @user to current_user" do
    #   get :show, id: @testuser.id
    #   expect(@user).to eq @testuser
    # end
    it "renders the show template" do
      get :show, id: @testuser.id
      expect(response).to render_template :show
    end
  end

  describe "#current" do
    # pending "sets @user to current_user" do
    #   user = FactoryGirl.create :user
    #   stub_current_user(user)
    #   stub_authorize_user!
    #   get :current
    #   expect(@user).to eq(user)
    # end

    it "renders the show template" do
      get :current, current_user: @testuser
      expect(response).to render_template :show
    end
  end


end
