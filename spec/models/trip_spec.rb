require 'rails_helper'

RSpec.describe Trip, type: :model do
  let!(:user) { FactoryGirl.build :user }
  let!(:address) { FactoryGirl.build :address }
  let!(:trip1) { Trip.create(origin_address: address, destination_address: address, driver_id: user.id, leaving_at: Faker::Date.forward(3), arriving_at: Faker::Date.forward(10), available_volume: 50, max_weight: 40, rate: Faker::Commerce.price, content_restrictions: Faker::Lorem.paragraph(2), vehicle: "U-Haul Lambos") }

  it "is valid with a driver, origin address, destination address, leaving_at, arriving_at, available_volume, max_weight, rate, content_restrictions, vehicle" do
      expect(trip1).to be_valid
  end

  it "is invalid without a driver" do
      trip2 = trip1.update_attributes(driver_id: nil)
      expect(trip2).to eq false
  end
  it "is invalid without a destination address" do
      trip2 = trip1.update_attributes(destination_address_id: nil)
      expect(trip2).to eq false
  end
  it "is invalid without a origin address" do
      trip2 = trip1.update_attributes(origin_address_id: nil)
      expect(trip2).to eq false
  end
  it "belongs to a destination address which is an address object" do
    expect(trip1.destination_address).to be_a Address
  end
  it "belongs to an origin address which is an address object" do
    expect(trip1.origin_address).to be_a Address
  end
end