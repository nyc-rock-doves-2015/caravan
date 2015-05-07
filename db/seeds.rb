User.create(username: 'bob', password: '123')

10.times do
  User.create(username: Faker::Internet.user_name, password: '123')
end

3.times do
  20.times do
    Address.create(description: Faker::Commerce.color, street_address: Faker::Address.street_address, secondary_address: Faker::Address.secondary_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip_code: Faker::Address.zip_code)
  end

  parcel = Parcel.create(origin_address: Address.find(Address.pluck(:id).sample), destination_address: Address.find(Address.pluck(:id).sample), sender: User.find(User.pluck(:id).sample), pickup_by: Faker::Date.forward(4), deliver_by: Faker::Date.forward(10), weight: rand(1..200), volume: rand(1..400), delivery_notes: Faker::Lorem.paragraph(2), description: Faker::Lorem.paragraph(2))

  trip = Trip.create(origin_address: Address.find(Address.pluck(:id).sample), destination_address: Address.find(Address.pluck(:id).sample), driver: User.find(User.pluck(:id).sample), leaving_at: Faker::Date.forward(3), arriving_at: Faker::Date.forward(10), available_volume: rand(10..400), max_weight: rand(1..200), rate: Faker::Commerce.price , content_restrictions: Faker::Lorem.paragraph(2), vehicle: "U-Haul Lambos")

  trip.parcels << parcel
end


