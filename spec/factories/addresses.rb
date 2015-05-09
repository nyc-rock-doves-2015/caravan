FactoryGirl.define do
 factory :address do
    id 1
    association :user, factory: :user
    city Faker::Address.city
    state Faker::Address.state_abbr
    zip_code Faker::Address.zip_code
  end
end
