class Address < ActiveRecord::Base
  belongs_to :user
  validates :state, length: { maximum: 2 }
end
