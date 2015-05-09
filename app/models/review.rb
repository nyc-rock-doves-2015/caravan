class Review < ActiveRecord::Base
  belongs_to :trip
  belongs_to :parcel
end
