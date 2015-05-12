FactoryGirl.define do
  factory :address do
    sequence(:id) { |n| n }
    association :user, factory: :user # redundant, I think.
    city 'Portland' # If you know Faker, why not Faker a city and state too?
    state 'OR'
    zip_code Faker::Address.zip_code
  end
end
