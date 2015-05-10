require 'rails_helper'

RSpec.describe ParcelsController, type: :controller do
  let(:user) { FactoryGirl.create :user }
  before :each do
    allow(controller).to receive(:current_user) { user}
  end

  context "#create" do
    it "redirects to the users profile" do
      p_params = FactoryGirl.attributes_for(:parcel)
      o_params = FactoryGirl.attributes_for(:address, user_id: user.id)
      d_params = FactoryGirl.attributes_for(:address, user_id: user.id)
      expect {post :create, origin_address:o_params, destination_address:d_params, parcel:p_params}.to change{Parcel.count}.by(1)
      expect(response).to redirect_to profile_path
    end

    it "creates a parcels with valid params" do
      p_params = FactoryGirl.attributes_for(:parcel)
      o_params = FactoryGirl.attributes_for(:address, user_id: user.id)
      d_params = FactoryGirl.attributes_for(:address, user_id: user.id)
      expect {post :create, origin_address:o_params, destination_address:d_params, parcel:p_params}.to change{Parcel.count}.by(1)
    end
  end
  context '#destroy' do
    before :each do
      @parcel = FactoryGirl.create(:parcel)
      user = FactoryGirl.create(:user)
      allow(controller).to receive(:current_user) { user}
    end
    it "deletes a parcel" do
      expect {
        delete :destroy, id: @parcel
      }.to change{Parcel.count}.by(-1)
    end
  end

  context "#edit" do
    before :each do
      p_params = FactoryGirl.attributes_for(:parcel)
      o_params = FactoryGirl.attributes_for(:address, user_id: user.id)
      d_params = FactoryGirl.attributes_for(:address, user_id: user.id)
      post :create, origin_address:o_params, destination_address:d_params, parcel:p_params
      @parcel = Parcel.last
      user = FactoryGirl.create(:user)
      allow(controller).to receive(:current_user) { user}
    end

    it "updates a parcel" do
      put :update, id: @parcel, parcel: FactoryGirl.attributes_for(:parcel, delivery_notes: 'yo'), origin_address: FactoryGirl.attributes_for(:address, user_id: user.id), destination_address: FactoryGirl.attributes_for(:address, user_id: user.id)
      @parcel.reload
      expect(@parcel.delivery_notes).to eq('yo')
    end

    it "renders the edit page if parcel doesn't save" do
      put :update, id: @parcel, parcel: FactoryGirl.attributes_for(:parcel, delivery_notes: 'yo'), origin_address: FactoryGirl.attributes_for(:address, user_id: user.id), destination_address: FactoryGirl.attributes_for(:address, user_id: user.id)
      @parcel.reload
      expect(@parcel.delivery_notes).to eq('yo')
    end
  end
end
