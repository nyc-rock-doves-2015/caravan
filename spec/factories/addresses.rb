FactoryGirl.define do
  factory :address do
    sequence(:id) { |n| n }
    association :user, factory: :user
    city Faker::Address.city
    state Faker::Address.state_abbr
    zip_code Faker::Address.zip_code
  end
end
