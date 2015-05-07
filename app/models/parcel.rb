class Parcel < ActiveRecord::Base
  belongs_to :sender, class_name: "User"
  belongs_to :origin_address, class_name: "Address"
  belongs_to :destination_address, class_name: "Address"
end
