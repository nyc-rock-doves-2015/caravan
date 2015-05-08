FactoryGirl.define do
  factory :parcel do
    weight 4
    volume 3
    description "pet cat"
    pickup_by Date.parse('1995-03-03')
    deliver_by Date.parse('1995-04-04')
    origin_address_id 1
    destination_address_id 2
    sender_id 1
    delivery_notes "fragile"
  end

end
