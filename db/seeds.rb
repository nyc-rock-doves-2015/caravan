#this user has matched trips
User.create(username: 'Bob', password: '123')
#this user can review a sender, and parcels to deliver
User.create(username: 'Kenny', password: '123')
User.create(username: 'Charles', password: '123')
User.create(username: 'Grant', password: '123')
User.create(username: 'Vinh', password: '123')
User.create(username: 'Alex', password: '123')
User.create(username: 'Grace', password: '123')
User.create(username: 'Julia', password: '123')
User.create(username: 'Irene', password: '123')
User.create(username: 'Mary', password: '123')
User.create(username: 'Dan', password: '123')
User.create(username: 'Ben', password: '123')
User.create(username: 'Steven', password: '123')
User.create(username: 'Matt', password: '123')
User.create(username: 'Aaron', password: '123')
User.create(username: 'Taylor', password: '123')
User.create(username: 'Justin', password: '123')
User.create(username: 'Scooter', password: '123')
User.create(username: 'Ariella', password: '123')
User.create(username: 'Dean', password: '123')

#going from nyc to sf, seed a lot of origin address that could be nyc, then destination addresses in sf or cali

#ny addresses

Address.create(description: "Brown Building", street_address: "48 Wall Street", secondary_address: "Apartment 501", city: "New York", state: "NY", zip_code: 10005, user_id: 1)

Address.create(description: "Use Side Door", street_address: "16 Marketfield St", secondary_address: "Apartment 20", city: "New York", state: "NY", zip_code: 10004, user_id: 2)

Address.create(description: "Speak to Doorman", street_address: "80 Greenwich St", secondary_address: "Apartment 204A", city: "New York", state: "NY", zip_code: 10006, user_id: 3)

Address.create(description: "Be careful on stairs", street_address: "8 Beekman St", secondary_address: "Apartment 204A", city: "New York", state: "NY", zip_code: 10038, user_id: 4)

Address.create(description: "Be careful on stairs", street_address: "85 Murray St", secondary_address: "Apartment 204A", city: "New York", state: "NY", zip_code: 10005, user_id: 5)

Address.create(description: "Be careful on stairs", street_address: "70 Beach St", secondary_address: "Apartment 16B", city: "New York", state: "NY", zip_code: 10013, user_id: 6)

Address.create(description: "Brown House", street_address: "330 W Broadway", secondary_address: "Apartment 16B", city: "New York", state: "NY", zip_code: 10013, user_id: 7)

Address.create(description: "Yellow House", street_address: "178 Mott St", secondary_address: "Apartment 16B", city: "New York", state: "NY", zip_code: 10012, user_id: 8)

Address.create(description: "Use the side door", street_address: "10 7th Ave S", secondary_address: "Apartment 12C", city: "New York", state: "NY", zip_code: 10014, user_id: 9)

Address.create(description: "Use the side door", street_address: "36 W 9th St", secondary_address: "Apartment 12C", city: "New York", state: "NY", zip_code: 10011, user_id: 10)

Address.create(description: "Use the side door", street_address: "244 W 11th St", secondary_address: "Apartment 12C", city: "New York", state: "NY", zip_code: 10014, user_id: 11)

Address.create(description: "Use the side door", street_address: "37 E 12th St", secondary_address: "Suite 11", city: "New York", state: "NY", zip_code: 10003, user_id: 12)

Address.create(description: "Brown Building", street_address: "26 Perry St", secondary_address: "Suite 11", city: "New York", state: "NY", zip_code: 10014, user_id: 13)

Address.create(description: "Brown Building", street_address: "189 Madison Ave", secondary_address: "Suite 11", city: "New York", state: "NY", zip_code: 10016, user_id: 14)

Address.create(description: "Brown Building", street_address: "299 Grand St", secondary_address: "Suite 11", city: "New York", state: "NY", zip_code: 10002, user_id: 15)

Address.create(description: "Beware of our dog", street_address: "85 Mulberry St", secondary_address: "Apartment 5E", city: "New York", state: "NY", zip_code: 10013, user_id: 16)

Address.create(description: "Beware of our dog", street_address: "154 Front St", secondary_address: "Apartment 5E", city: "New York", state: "NY", zip_code: 10038, user_id: 17)

Address.create(description: "Beware of our dog", street_address: "333 Hudson St", secondary_address: "Apartment 5E", city: "New York", state: "NY", zip_code: 10013, user_id: 18)

Address.create(description: "Beware of our dog", street_address: "130 W Houston St", secondary_address: "Apartment 5E", city: "New York", state: "NY", zip_code: 10012, user_id: 19)

Address.create(description: "Beware of our dog", street_address: "24 Bond St", secondary_address: "Apartment 5E", city: "New York", state: "NY", zip_code: 10012, user_id: 20)

Address.create(description: "Enter through garage", street_address: "79 St Marks Pl", secondary_address: "Apartment 501", city: "New York", state: "NY", zip_code: 10003, user_id: 21)

Address.create(description: "Enter through garage", street_address: "238 W 14th St", secondary_address: "Apartment 1A", city: "New York", state: "NY", zip_code: 10011, user_id: 22)

Address.create(description: "Enter through garage", street_address: "33 E 12th St", secondary_address: "Apartment 17", city: "New York", state: "NY", zip_code: 10003, user_id: 23)

Address.create(description: "White Building", street_address: "101 Thompson St", secondary_address: "Apartment 501", city: "New York", state: "NY", zip_code: 10012, user_id: 24)

Address.create(description: "Brick Building", street_address: "35 White St", secondary_address: "Apartment 5", city: "New York", state: "NY", zip_code: 10013, user_id: 25)

#cali addresses

Address.create(description: "Brick Building", street_address: "2001 Lombard St", secondary_address: "Apartment 15A", city: "San Francisco", state: "CA", zip_code: 94123, user_id: 1)

Address.create(description: "Brick Building", street_address: "1920 Pacific Ave", secondary_address: "Apartment 15A", city: "San Francisco", state: "CA", zip_code: 94109, user_id: 2)

Address.create(description: "Brick Building", street_address: "2252 Fillmore St", secondary_address: "Apartment 15A", city: "San Francisco", state: "CA", zip_code: 94115, user_id: 3)

Address.create(description: "White Building", street_address: "1760 Bush St", secondary_address: "Apartment 15A", city: "San Francisco", state: "CA", zip_code: 94109, user_id: 4)

Address.create(description: "White Building", street_address: "956 Ellis St", secondary_address: "Apartment 15A", city: "San Francisco", state: "CA", zip_code: 94109, user_id: 5)

Address.create(description: "White Building", street_address: "1159 Washington St", secondary_address: "Suite 36", city: "San Francisco", state: "CA", zip_code: 94108, user_id: 6)

Address.create(description: "White Building", street_address: "498 Mason St", secondary_address: "Suite 36", city: "San Francisco", state: "CA", zip_code: 94102, user_id: 7)

Address.create(description: "Use Side Door", street_address: "631 O'Farrell St", secondary_address: "Suite 36", city: "San Francisco", state: "CA", zip_code: 94109, user_id: 8)

Address.create(description: "Use Side Door", street_address: "216 5th St", secondary_address: "Apartment 3", city: "San Francisco", state: "CA", zip_code: 94103, user_id: 9)

Address.create(description: "Use Side Door", street_address: "637 Gough St", secondary_address: "Apartment 3", city: "San Francisco", state: "CA", zip_code: 94102, user_id: 10)

Address.create(description: "Use Side Door", street_address: "23 Pearl St", secondary_address: "Apartment 3", city: "San Francisco", state: "CA", zip_code: 94103, user_id: 11)

Address.create(description: "Speak to Doorman", street_address: "77 Beale St", secondary_address: "Apartment 3", city: "San Francisco", state: "CA", zip_code: 94105, user_id: 12)

Address.create(description: "Speak to Doorman", street_address: "35 Stanford St", secondary_address: "Back Door", city: "San Francisco", state: "CA", zip_code: 94107, user_id: 13)

Address.create(description: "Speak to Doorman", street_address: "44 McAllister St", secondary_address: "Back Door", city: "San Francisco", state: "CA", zip_code: 94102, user_id: 14)

Address.create(description: "Beware of our dog", street_address: "938 Divisadero St", secondary_address: "Back Door", city: "San Francisco", state: "CA", zip_code: 94123, user_id: 15)

Address.create(description: "Beware of our dog", street_address: "855 Waller St", secondary_address: "Back Door", city: "San Francisco", state: "CA", zip_code: 94117, user_id: 16)

Address.create(description: "Beware of our dog", street_address: "1315 Grove St", secondary_address: "Apartment 3C", city: "San Francisco", state: "CA", zip_code: 94117, user_id: 17)

Address.create(description: "Beware of our dog", street_address: "2979 Jackson St", secondary_address: "Apartment 1A", city: "San Francisco", state: "CA", zip_code: 94115, user_id: 18)

Address.create(description: "Be careful on the stairss", street_address: "2646 California St", secondary_address: "Apartment 6", city: "San Francisco", state: "CA", zip_code: 94115, user_id: 19)

Address.create(description: "Be careful on the stairss", street_address: "255 10th St", secondary_address: "Apartment 5", city: "San Francisco", state: "CA", zip_code: 94103, user_id: 20)

#create parcels

parcel1 = Parcel.create(origin_address: Address.find(1), destination_address: Address.find(26), sender: User.find(1), pickup_by: Faker::Date.forward(4), deliver_by: Faker::Date.forward(11), weight: 10, volume: 2, delivery_notes: "Very fragile, be careful", description: "Antique Vase")

parcel2 = Parcel.create(origin_address: Address.find(1), destination_address: Address.find(27), sender: User.find(1), pickup_by: Faker::Date.forward(4), deliver_by: Faker::Date.forward(11), weight: 15, volume: 8, delivery_notes: "keep package face up", description: "wooden sculpture")

parcel3 = Parcel.create(origin_address: Address.find(1), destination_address: Address.find(28), sender: User.find(1), pickup_by: Faker::Date.forward(4), deliver_by: Faker::Date.forward(11), weight: 3, volume: 2, delivery_notes: "must be fed every 3 hours", description: "skateboard decks")

parcel4 = Parcel.create(origin_address: Address.find(1), destination_address: Address.find(29), sender: User.find(1), pickup_by: Faker::Date.forward(4), deliver_by: Faker::Date.forward(11), weight: 30, volume: 10, delivery_notes: "", description: "guitar collection")

parcel5 = Parcel.create(origin_address: Address.find(1), destination_address: Address.find(30), sender: User.find(1), pickup_by: Faker::Date.forward(4), deliver_by: Faker::Date.forward(11), weight: 200, volume: 9, delivery_notes: "very heavy, be careful", description: "piano")

#create trips

trip1 = Trip.create(origin_address: Address.find(2), destination_address: Address.find(30), driver: User.find(2), leaving_at: Faker::Date.forward(3), arriving_at: Faker::Date.forward(10), available_volume: 2, max_weight: 10, rate: 10, content_restrictions: Faker::Lorem.paragraph(2), vehicle: "U-Haul")

trip2 = Trip.create(origin_address: Address.find(3), destination_address: Address.find(31), driver: User.find(3), leaving_at: Faker::Date.forward(3), arriving_at: Faker::Date.forward(10), available_volume: 3, max_weight: 10, rate: 10, content_restrictions: Faker::Lorem.paragraph(2), vehicle: "U-Haul")

trip3 = Trip.create(origin_address: Address.find(4), destination_address: Address.find(32), driver: User.find(4), leaving_at: Faker::Date.forward(3), arriving_at: Faker::Date.forward(10), available_volume: 5, max_weight: 50, rate: 12, content_restrictions: Faker::Lorem.paragraph(2), vehicle: "Honda Civic")

trip4 = Trip.create(origin_address: Address.find(5), destination_address: Address.find(33), driver: User.find(5), leaving_at: Faker::Date.forward(3), arriving_at: Faker::Date.forward(10), available_volume: 5, max_weight: 50, rate: 7, content_restrictions: Faker::Lorem.paragraph(2), vehicle: "Toyota Avalon")

trip5 = Trip.create(origin_address: Address.find(6), destination_address: Address.find(34), driver: User.find(6), leaving_at: Faker::Date.forward(3), arriving_at: Faker::Date.forward(10), available_volume: 12, max_weight: 50, rate: 35, content_restrictions: Faker::Lorem.paragraph(2), vehicle: "Toyota Avalon")

trip6 = Trip.create(origin_address: Address.find(7), destination_address: Address.find(35), driver: User.find(7), leaving_at: Faker::Date.forward(3), arriving_at: Faker::Date.forward(10), available_volume: 15, max_weight: 200, rate: 30, content_restrictions: Faker::Lorem.paragraph(2), vehicle: "Toyota Avalon")

trip7 = Trip.create(origin_address: Address.find(8), destination_address: Address.find(36), driver: User.find(8), leaving_at: Faker::Date.forward(3), arriving_at: Faker::Date.forward(10), available_volume: 15, max_weight: 200, rate: 21, content_restrictions: Faker::Lorem.paragraph(2), vehicle: "Range Rover")

trip8 = Trip.create(origin_address: Address.find(9), destination_address: Address.find(37), driver: User.find(9), leaving_at: Faker::Date.forward(3), arriving_at: Faker::Date.forward(10), available_volume: 300, max_weight: 200, rate: 23, content_restrictions: Faker::Lorem.paragraph(2), vehicle: "Range Rover")

trip9 = Trip.create(origin_address: Address.find(10), destination_address: Address.find(38), driver: User.find(10), leaving_at: Faker::Date.forward(3), arriving_at: Faker::Date.forward(10), available_volume: 20, max_weight: 80, rate: 20, content_restrictions: Faker::Lorem.paragraph(2), vehicle: "Range Rover")

trip10 = Trip.create(origin_address: Address.find(11), destination_address: Address.find(39), driver: User.find(11), leaving_at: Faker::Date.forward(3), arriving_at: Faker::Date.forward(10), available_volume: 10, max_weight: 300, rate: 39, content_restrictions: Faker::Lorem.paragraph(2), vehicle: "BMW 335i")


#add parcels to trips

trip1.parcels << parcel3

trip2.parcels << parcel1

trip3.parcels << parcel2

trip10.parcels << parcel5



# for testing trips matching parcel

# pdx1 = Address.create(description: Faker::Commerce.color, street_address: Faker::Address.street_address, secondary_address: Faker::Address.secondary_address, city: 'Portland', state: 'OR', zip_code: Faker::Address.zip_code, user_id: User.pluck(:id).sample)

# pdx2 = Address.create(description: Faker::Commerce.color, street_address: Faker::Address.street_address, secondary_address: Faker::Address.secondary_address, city: 'Portland', state: 'OR', zip_code: Faker::Address.zip_code, user_id: User.pluck(:id).sample)

# parcel = Parcel.create(origin_address: Address.find(Address.pluck(:id).sample), destination_address: pdx1, sender: User.find(User.pluck(:id).sample), pickup_by: '8/5/2015', deliver_by: '15/5/2015', weight: 1, volume: 10, delivery_notes: Faker::Lorem.paragraph(2), description: 'parcel 1 for testing matching trips')

# parcel2 = Parcel.create(origin_address: Address.find(Address.pluck(:id).sample), destination_address: pdx1, sender: User.find(User.pluck(:id).sample), pickup_by: '8/5/2015', deliver_by: '15/5/2015', weight: 1, volume: 10, delivery_notes: Faker::Lorem.paragraph(2), description: 'parcel 2 for testing matching trips')

# 5.times do
#   Trip.create(origin_address: Address.find(Address.pluck(:id).sample), destination_address: pdx2, driver: User.find(User.pluck(:id).sample), leaving_at: '9/5/2015', arriving_at: '13/5/2015', available_volume: 50, max_weight: 5, rate: Faker::Commerce.price , content_restrictions: 'matching trip', vehicle: "U-Haul Lambos")
# end

#Test Reviewing a Trip/Driver
# trip_to_review = Trip.create(origin_address: Address.find(Address.pluck(:id).sample), destination_address: Address.find(Address.pluck(:id).sample), driver_id: 2, leaving_at: Faker::Date.forward(3), arriving_at: Faker::Date.forward(10), available_volume: rand(10..400), max_weight: rand(1..200), rate: Faker::Commerce.price , content_restrictions: Faker::Lorem.paragraph(2), vehicle: "U-Haul Lambos")
# trip_to_review.parcels.create(origin_address: Address.find(Address.pluck(:id).sample), destination_address: Address.find(Address.pluck(:id).sample), sender_id: 1, pickup_by: Faker::Date.forward(4), deliver_by: Faker::Date.forward(10), weight: rand(1..200), volume: rand(1..400), delivery_notes: Faker::Lorem.paragraph(2), description: Faker::Lorem.paragraph(2))

#Test Reviewing a Parcel/Sender
# parcel_to_review = Parcel.create(origin_address: Address.find(Address.pluck(:id).sample), destination_address: Address.find(Address.pluck(:id).sample), sender_id: 2, pickup_by: Faker::Date.forward(4), deliver_by: Faker::Date.forward(10), weight: rand(1..200), volume: rand(1..400), delivery_notes: Faker::Lorem.paragraph(2), description: Faker::Lorem.paragraph(2))

# trip = Trip.create(origin_address: Address.find(Address.pluck(:id).sample), destination_address: Address.find(Address.pluck(:id).sample), driver_id: 1, leaving_at: Faker::Date.forward(3), arriving_at: Faker::Date.forward(10), available_volume: rand(10..400), max_weight: rand(1..200), rate: Faker::Commerce.price , content_restrictions: Faker::Lorem.paragraph(2), vehicle: "U-Haul Lambos")

# trip.parcels << parcel_to_review

# Create some messages between Users
User.all.each do |receiver|
  5.times do
    sender = User.find(User.pluck(:id).sample)
    sender.send_message(receiver, Faker::Hacker.say_something_smart, Faker::Hacker.noun)
  end
end