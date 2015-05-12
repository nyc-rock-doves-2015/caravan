FactoryGirl.define do
  factory :parcel do
    # FactoryGirl would be really good here....
    weight 4
    volume 3
    description "pet cat"
    pickup_by Date.parse('1995-03-03')
    deliver_by Date.parse('1995-04-04')
    sender_id 1
    # Better to have as a sub-factory of parcel, fragile_parcel
    delivery_notes "fragile"
    association :destination_address, factory: :address
    association :origin_address, factory: :address
    association :trip, factory: :trip #when the factory is the same name as the model, not required.
  end
end
