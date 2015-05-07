class Trip < ActiveRecord::Base
  belongs_to :driver, class_name: "User"
  has_many :parcels
  belongs_to :origin_address, class_name: "Address"
  belongs_to :destination_address, class_name: "Address"
end
