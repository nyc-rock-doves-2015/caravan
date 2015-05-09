User.create(username: 'bob', password: '123')

10.times do
  User.create(username: Faker::Internet.user_name, password: '123')
end

3.times do
  20.times do
    Address.create(description: Faker::Commerce.color, street_address: Faker::Address.street_address, secondary_address: Faker::Address.secondary_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip_code: Faker::Address.zip_code, user_id: User.pluck(:id).sample)
  end

  parcel = Parcel.create(origin_address: Address.find(Address.pluck(:id).sample), destination_address: Address.find(Address.pluck(:id).sample), sender: User.find(User.pluck(:id).sample), pickup_by: Faker::Date.forward(4), deliver_by: Faker::Date.forward(10), weight: rand(1..200), volume: rand(1..400), delivery_notes: Faker::Lorem.paragraph(2), description: Faker::Lorem.paragraph(2))

  trip = Trip.create(origin_address: Address.find(Address.pluck(:id).sample), destination_address: Address.find(Address.pluck(:id).sample), driver: User.find(User.pluck(:id).sample), leaving_at: Faker::Date.forward(3), arriving_at: Faker::Date.forward(10), available_volume: rand(10..400), max_weight: rand(1..200), rate: Faker::Commerce.price , content_restrictions: Faker::Lorem.paragraph(2), vehicle: "U-Haul Lambos")

  trip.parcels << parcel
end

# for testing trips matching parcel

pdx1 = Address.create(description: Faker::Commerce.color, street_address: Faker::Address.street_address, secondary_address: Faker::Address.secondary_address, city: 'Portland', state: 'OR', zip_code: Faker::Address.zip_code, user_id: User.pluck(:id).sample)

pdx2 = Address.create(description: Faker::Commerce.color, street_address: Faker::Address.street_address, secondary_address: Faker::Address.secondary_address, city: 'Portland', state: 'OR', zip_code: Faker::Address.zip_code, user_id: User.pluck(:id).sample)

parcel = Parcel.create(origin_address: Address.find(Address.pluck(:id).sample), destination_address: pdx1, sender: User.find(User.pluck(:id).sample), pickup_by: '8/5/2015', deliver_by: '15/5/2015', weight: 1, volume: 10, delivery_notes: Faker::Lorem.paragraph(2), description: 'parcel 1 for testing matching trips')

parcel2 = Parcel.create(origin_address: Address.find(Address.pluck(:id).sample), destination_address: pdx1, sender: User.find(User.pluck(:id).sample), pickup_by: '8/5/2015', deliver_by: '15/5/2015', weight: 1, volume: 10, delivery_notes: Faker::Lorem.paragraph(2), description: 'parcel 2 for testing matching trips')

5.times do
  Trip.create(origin_address: Address.find(Address.pluck(:id).sample), destination_address: pdx2, driver: User.find(User.pluck(:id).sample), leaving_at: '9/5/2015', arriving_at: '13/5/2015', available_volume: 50, max_weight: 5, rate: Faker::Commerce.price , content_restrictions: 'matching trip', vehicle: "U-Haul Lambos")
end

#Test Reviewing a Trip/Driver
trip_to_review = Trip.create(origin_address: Address.find(Address.pluck(:id).sample), destination_address: Address.find(Address.pluck(:id).sample), driver_id: 2, leaving_at: Faker::Date.forward(3), arriving_at: Faker::Date.forward(10), available_volume: rand(10..400), max_weight: rand(1..200), rate: Faker::Commerce.price , content_restrictions: Faker::Lorem.paragraph(2), vehicle: "U-Haul Lambos")
trip_to_review.parcels.create(origin_address: Address.find(Address.pluck(:id).sample), destination_address: Address.find(Address.pluck(:id).sample), sender_id: 1, pickup_by: Faker::Date.forward(4), deliver_by: Faker::Date.forward(10), weight: rand(1..200), volume: rand(1..400), delivery_notes: Faker::Lorem.paragraph(2), description: Faker::Lorem.paragraph(2))

#Test Reviewing a Parcel/Sender
parcel_to_review = Parcel.create(origin_address: Address.find(Address.pluck(:id).sample), destination_address: Address.find(Address.pluck(:id).sample), sender_id: 2, pickup_by: Faker::Date.forward(4), deliver_by: Faker::Date.forward(10), weight: rand(1..200), volume: rand(1..400), delivery_notes: Faker::Lorem.paragraph(2), description: Faker::Lorem.paragraph(2))

trip = Trip.create(origin_address: Address.find(Address.pluck(:id).sample), destination_address: Address.find(Address.pluck(:id).sample), driver_id: 1, leaving_at: Faker::Date.forward(3), arriving_at: Faker::Date.forward(10), available_volume: rand(10..400), max_weight: rand(1..200), rate: Faker::Commerce.price , content_restrictions: Faker::Lorem.paragraph(2), vehicle: "U-Haul Lambos")

trip.parcels << parcel_to_review


