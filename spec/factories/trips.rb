FactoryGirl.define do
  factory :trip do
    sequence(:id) { |n| n }
    leaving_at '9/5/2015'
    arriving_at '13/5/2015'
    available_volume 50
    max_weight 5
    rate Faker::Commerce.price
    content_restrictions Faker::Lorem.paragraph(2)
    vehicle "U-Haul"
    association :driver, factory: :user
    association :destination_address, factory: :address
    association :origin_address, factory: :address
  end
end