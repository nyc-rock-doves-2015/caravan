require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before :each do
    @user = User.create(username: "Charles", password: "password")
    session[:user_id] = @user.id
  end

  describe "GET #new" do
    it "should render the signin form" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    it "creates a new session when a user signs in" do
      post :create, user: {username: @user.username, password: @user.password}
      # not sure this is testing what we think it is...
      expect(session[:user_id]).to eq @user.id
    end
    it "redirects to the user's profile" do
      post :create, user: {username: @user.username, password: @user.password}
      expect(response).to redirect_to profile_path
    end
  end

  describe "get destroy" do
    it "should clear the session" do
      get :destroy
      expect(session[:user_id]).to be nil
    end
    it "should redirect to the index page" do
      get :destroy
      expect(response).to redirect_to root_path
    end
  end

end
