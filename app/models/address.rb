class Address < ActiveRecord::Base
  belongs_to :user
  validates :state, length: { maximum: 2 }
  validates :user_id, :city, :state, :zip_code, presence: true
  geocoded_by  :full_address
  after_validation :geocode

  def full_address
    "#{street_address}, #{city_state}, #{zip_code}"
  end

  def city_state
    "#{city}, #{state}"
  end
end
