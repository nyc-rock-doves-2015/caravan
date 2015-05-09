class Trip < ActiveRecord::Base
  belongs_to :driver, class_name: "User"
  has_many :parcels
  has_many :reviews
  belongs_to :origin_address, class_name: "Address"
  belongs_to :destination_address, class_name: "Address"

  validates :origin_address_id, :destination_address_id, :driver_id, presence: :true
  validates :leaving_at, :arriving_at, :available_volume, :rate, presence: :true

  validates_associated :origin_address, :destination_address

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

  def self.all_matching_parcel(parcel)
    matching_trips = Trip.joins(:destination_address).where('addresses.city = ? and addresses.state = ?', parcel.destination_address.city, parcel.destination_address.state).where('arriving_at < ? and leaving_at > ?', parcel.deliver_by, parcel.pickup_by)
    matching_trips = matching_trips.where('max_weight > ?', parcel.weight) if parcel.weight
    matching_trips = matching_trips.where('available_volume > ?', parcel.volume) if parcel.volume
  end

  def self.match_reviewer(user_id, current_id)
    trips = Trip.where(driver_id: user_id)
    match = []
    trips.each do |trip|
      trip.parcels.each do |parcel|
        if parcel.sender_id == current_id
          match << trip
        end
      end
    end
    match
  end
end
