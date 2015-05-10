class Review < ActiveRecord::Base
  belongs_to :trip
  belongs_to :parcel
  belongs_to :reviewer, class_name: "User"
  belongs_to :reviewee, class_name: "User"

  validates :content, presence: true
  validates :rating, numericality: { only_integer: true }, inclusion: { in: 1..5 }
end
