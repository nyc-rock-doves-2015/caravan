FactoryGirl.define do
  factory :user do
    sequence(:id) { |n| n }
    username "Bob"
    password "123"
  end
end
