FactoryGirl.define do
  factory :trip do
    sequence(:id) { |n| n }
    leaving_at Faker::Date.forward(3)
    arriving_at Faker::Date.forward(10)
    available_volume 40
    max_weight 50
    rate Faker::Commerce.price
    content_restrictions Faker::Lorem.paragraph(2)
    vehicle "U-Haul"
    driver_id "1"
    association :driver, factory: :user
    association :destination_address, factory: :address
    association :origin_address, factory: :address
  end
end
