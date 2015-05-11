class Address < ActiveRecord::Base
  belongs_to :user
  validates :state, length: { maximum: 2 }
  validates :user_id, :city, :state, :zip_code, presence: true
  geocoded_by  :zip_code
  after_validation :geocode
end
