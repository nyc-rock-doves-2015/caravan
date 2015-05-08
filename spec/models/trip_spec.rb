require 'rails_helper'

RSpec.describe Trip, type: :model do
  let!(:user) { FactoryGirl.build :user }
  let!(:address) { FactoryGirl.build :address }


    it "is valid with a driver, origin address, destination address, leaving_at, arriving_at, available_volume, max_weight, rate, content_restrictions, vehicle" do
     # trip = FactoryGirl.build(:trip)
      trip1 =  Trip.new(origin_address_id: address.id, destination_address_id: address.id, driver_id: user.id, leaving_at: Faker::Date.forward(3), arriving_at: Faker::Date.forward(10), available_volume: 50, max_weight: 40, rate: Faker::Commerce.price, content_restrictions: Faker::Lorem.paragraph(2), vehicle: "U-Haul Lambos")

      expect(trip1).to be_valid

 end
end