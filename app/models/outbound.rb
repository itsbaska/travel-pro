class Outbound < ApplicationRecord
  belongs_to :travelgrouping
  has_one :traveller, through: :travelgrouping
  validates :airline, :arrival, :departure, :airport, presence: true
  before_save :traveller_named, :date_format_arrival, :date_format_departure

  def traveller_named
    self.traveller_name = self.traveller.full_name
  end

  def date_format_arrival
    self.arrival_formatted = self.arrival.strftime('%a, %b. %d, %Y %H:%M')
  end

  def date_format_departure
    self.departure_formatted = self.departure.strftime('%a, %b. %d, %Y %H:%M')
  end
end
