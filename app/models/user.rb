class User < ActiveRecord::Base
  has_secure_password
  acts_as_messageable
  has_many :trips, foreign_key: :driver_id
  has_many :parcels, foreign_key: :sender_id

  has_many :reviews, foreign_key: :reviewer_id
  has_many :received_reviews, class_name: "Review", foreign_key: :reviewee_id
  # has_many :driver_reviews, class_name: "Review", through: :trips, source: :driver
  # has_many :sender_reviews, class_name: "Review", through: :parcels, source: :sender

  validates :username, presence: true

  def get_reputation
    count = self.received_reviews.count
    sum = 0
    self.received_reviews.each do |review|
      sum += review.rating
    end
    sum / count.to_f
  end

  # method for mailbox gem
  def name
    username
  end

  def mailboxer_email(object)
    nil # no mail to be sent by mailbox
  end
end
