FactoryGirl.define do
  factory :trip do
  leaving_at Faker::Date.forward(3)
  arriving_at Faker::Date.forward(10)
  available_volume rand(10..400)
  max_weight rand(1..200)
  rate Faker::Commerce.price
  content_restrictions Faker::Lorem.paragraph(2)
  vehicle "U-Haul"

  association :origin_address, factory: :address
  association :destination_address, factory: :address
  association :driver, factory: :user
  end

end