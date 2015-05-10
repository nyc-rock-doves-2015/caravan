FactoryGirl.define do
  factory :address do
    sequence(:id) { |n| n }
    association :user, factory: :user
    city 'Portland'
    state 'OR'
    zip_code Faker::Address.zip_code
  end
end
