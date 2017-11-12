class Outbound < ApplicationRecord
  belongs_to :travelgrouping
  has_one :traveller, through: :travelgrouping
  validates :airline, :arrival, :departure, :airport, presence: true
end
