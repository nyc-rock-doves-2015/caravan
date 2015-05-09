require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) {FactoryGirl.build :user}
  # test create
  describe "GET #new" do
    it "should render the signin form" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    it "creates a new session when a user signs in" do
      post :create, user: FactoryGirl.attributes_for(:user)
      expect(response).to redirect_to user_path(User.last.id)
    end
    it "renders the user's profile"
  end

  describe "get destroy" do
    it "should clear the session"
    it "should redirect to the index page"
  end

end
