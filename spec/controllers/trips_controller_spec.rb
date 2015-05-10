require 'rails_helper'

RSpec.describe TripsController, type: :controller do
  let(:user) { FactoryGirl.create :user }
  before :each do
    stub_current_user(user)
    stub_authorize_user!
  end

  # def new
  #   @url = trips_path
  #   @method = :post
  #   @submit_btn = "Create Trip"
  # end

  describe "GET #new" do
    it "assigns form variables" do
      get :new
      expect(assigns(:url)).to eq trips_path
      expect(assigns(:method)).to eq :post
      expect(assigns(:submit_btn)).to eq "Create Trip"
    end
  end

end
