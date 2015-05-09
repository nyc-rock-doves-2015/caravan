class Review < ActiveRecord::Base
  belongs_to :trip
  belongs_to :parcel
  belongs_to :reviewer, class_name: "User"
  belongs_to :reviewee, class_name: "User"
end
