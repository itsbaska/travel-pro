class User < ApplicationRecord
  has_secure_password
  before_save :full_name
  has_many :travelgroupings, foreign_key: :traveller_id
  has_many :trips, foreign_key: :organizer_id
  has_many :receipts, foreign_key: :purchaser_id
  has_many :outbounds, through: :travelgroupings, source: :outbounds
  has_many :inbounds, through: :travelgroupings, source: :inbounds
  has_many :travel_trips,  -> { distinct }, through: :travelgroupings, source: :trip

  validates :first_name, :last_name, :email, :phone_number, presence: true
  
  validates :email, uniqueness: true,  :format => { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :phone_number, :format => { with: /\d{3}-\d{3}-\d{4}/ }

  def full_name
    self.full_name = self.first_name + " " + self.last_name
  end
end
