FactoryGirl.define do
  factory :user do
    sequence(:id) { |n| n }
    username "Bob" # prob better to faker a name
    password "123" 
  end
end
