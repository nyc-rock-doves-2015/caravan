require 'rails_helper'

RSpec.describe TripsController, type: :controller do
  let(:user) { FactoryGirl.create :user }
  before :each do
    allow(controller).to receive(:current_user) { user}
  end

  describe "GET #new" do
    it "assigns form variables" do
      get :new
      expect(assigns(:url)).to eq trips_path
      expect(assigns(:submit_btn)).to eq "Create Trip"
    end
  end

  describe "GET #edit" do
    it "assigns the requested trip to @trip" do
      trip = FactoryGirl.create :trip
      get :edit, id: trip
      expect(assigns(:trip)).to eq trip
      expect(assigns(:url)).to eq trip_path
      expect(assigns(:submit_btn)).to eq "Update Trip"
    end
  end

  describe "GET #show" do
    it "assigns the requested trip to @trip" do
      trip = FactoryGirl.create :trip
      get :show, id: trip
      expect(assigns(:trip)).to eq trip
    end
  end

  describe "GET #index" do
    it "assigns the requested parcel to @parcel" do
      parcel = FactoryGirl.create :parcel
      get :index, parcel_id: parcel
      expect(assigns(:parcel)).to eq parcel
    end
  end

  describe "POST #create" do
    it "creates a trip with valid params" do
      t_params = FactoryGirl.attributes_for(:trip)
      o_params = FactoryGirl.attributes_for(:address, user_id: user.id)
      d_params = FactoryGirl.attributes_for(:address, user_id: user.id)
      expect {post :create, origin_address:o_params, destination_address:d_params, trip:t_params}.to change{Trip.count}.by(1)
    end

    it "redirects to the user's profile" do
      t_params = FactoryGirl.attributes_for(:trip)
      o_params = FactoryGirl.attributes_for(:address, user_id: user.id)
      d_params = FactoryGirl.attributes_for(:address, user_id: user.id)
      expect {post :create, origin_address:o_params, destination_address:d_params, trip:t_params}.to change{Trip.count}.by(1)
      expect(response).to redirect_to profile_path
    end
  end

  describe 'DELETE #destroy' do
    it "deletes a trip" do
      trip = FactoryGirl.create(:trip)
      user = FactoryGirl.create(:user)
      allow(controller).to receive(:current_user) { user}

      expect {
        delete :destroy, id: trip
      }.to change{Trip.count}.by(-1)
    end
  end
end
