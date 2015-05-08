FactoryGirl.define do
  factory :address do
    description Faker::Lorem.word
    street_address Faker::Address.street_address
    secondary_address Faker::Address.street_address
    city Faker::Address.city
    state Faker::Address.state_abbr
    zip_code Faker::Address.zip_code
  end
end
