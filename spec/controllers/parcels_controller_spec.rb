require 'rails_helper'

RSpec.describe ParcelsController, type: :controller do

  let(:user) { FactoryGirl.create :user }
  let(:origin_address) { FactoryGirl.create :address, user: user}
  let(:destination_address) { FactoryGirl.create :address, user: user}
  let(:parcel1) { FactoryGirl.create :parcel, origin_address: origin_address, destination_address: destination_address }
  let(:parcel2) { FactoryGirl.create :parcel, origin_address: origin_address, destination_address: destination_address }
  let(:parcel3) { Parcel.new(volume:"hello") }

  context "#create" do
    it "redirects to the users profile" do
      p_params = FactoryGirl.attributes_for(:parcel)
      o_params = FactoryGirl.attributes_for(:address, user_id: user.id)
      d_params = FactoryGirl.attributes_for(:address, user_id:user.id)
      expect {post :create, origin_address:o_params, destination_address:d_params, parcel:p_params}.to change{Parcel.count}.by(1)
      expect(response).to redirect_to profile_path
    end

    it "creates a parcels with valid params" do
      p_params = FactoryGirl.attributes_for(:parcel)
      o_params = FactoryGirl.attributes_for(:address, user_id: user.id)
      d_params = FactoryGirl.attributes_for(:address, user_id:user.id)
      expect {post :create, origin_address:o_params, destination_address:d_params, parcel:p_params}.to change{Parcel.count}.by(1)
    end

    it "creates a parcels with valid params" do
      p_params = FactoryGirl.attributes_for(:parcel)
      o_params = FactoryGirl.attributes_for(:address, user_id: user.id)
      d_params = FactoryGirl.attributes_for(:address, user_id:user.id)
      expect {post :create, origin_address:o_params, destination_address:d_params, parcel:p_params}.to change{Parcel.count}.by(1)
    end
  end


end
