class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :travelgroupings, foreign_key: :traveller_id
  has_many :trips, foreign_key: :organizer_id
  has_many :receipts, foreign_key: :purchaser_id
  has_many :outbounds, through: :travelgroupings, source: :outbounds
  has_many :inbounds, through: :travelgroupings, source: :inbounds
  has_many :travel_trips, through: :travelgroupings, source: :trip

  validates :first_name, :last_name, :email, :phone_number, presence: true
  validates :email, uniqueness: true,  :format => { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :phone_number, :format => { with: /\d{3}-\d{3}-\d{4}/ }
end
