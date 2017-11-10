class Outbound < ApplicationRecord
  belongs_to :travelgrouping
  validates :airline, :arrival, :departure, :airport, presence: true
end
