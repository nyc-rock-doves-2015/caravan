class Trip < ActiveRecord::Base
  belongs_to :driver, class_name: "User"
  has_many :parcels
  belongs_to :origin_address, class_name: "Address"
  belongs_to :destination_address, class_name: "Address"

  def self.build(origin_address_params, destination_address_params, trip_params)
    origin_address = Address.new(origin_address_params)
    unless origin_address.save
      return origin_address
    end

    destination_address = Address.new(destination_address_params)
    unless destination_address.save
      origin_address.destroy
      return destination_address
    end

    trip = Trip.new(trip_params)
    trip.origin_address = origin_address
    trip.destination_address = destination_address

    if trip.save
      return trip
    else
      origin_address.destroy
      destination_address.destroy
      trip.destroy
      return trip
    end
  end

  validates :origin_address_id, :destination_address_id, :driver_id, presence: :true
  validates :leaving_at, :arriving_at, :available_volume, :rate, presence: :true

  validates_associated :origin_address, :destination_address

end
