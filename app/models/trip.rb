class Trip < ApplicationRecord
  has_many :travelgroupings
  has_many :receipts
  belongs_to :organizer, class_name: "User"
  has_many :travellers, through: :travelgroupings, source: :traveller
  has_many :inbound_flights, through: :travelgroupings, source: :inbounds
  has_many :outbound_flights, through: :travelgroupings, source: :outbounds

  validates :name, :location, :budget, presence: true
  validates_numericality_of :budget, :greater_than => 0
end
