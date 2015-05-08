class User < ActiveRecord::Base
  has_secure_password
  has_many :trips, foreign_key: :driver_id
  has_many :parcels, foreign_key: :sender_id

  validates :username, :password, presence: true
end
