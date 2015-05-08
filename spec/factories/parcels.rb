FactoryGirl.define do
  factory :parcel do
    weight 4
    volume 3
    description "pet cat"
    pickup_by 03/03/1995
    deliver_by 04/04/1995
    origin_address_id 1
    destination_address_id 3
    sender_id 1
    delivery_notes "fragile"
  end

end
