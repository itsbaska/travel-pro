class Trip < ApplicationRecord
  has_many :travelgroupings
  has_many :receipts
  belongs_to :organizer, class_name: "User"
  has_many :travellers,  -> { distinct }, through: :travelgroupings, source: :traveller
  has_many :inbound_flights, through: :travelgroupings, source: :inbounds
  has_many :outbound_flights, through: :travelgroupings, source: :outbounds
  validates :name, :location, :budget, presence: true
  validates_numericality_of :budget, :greater_than => 0
  before_save :organizer_person, :start_date_format, :end_date_format

  def organizer_person
    self.organizer_name = self.organizer.full_name
  end

  def start_date_format
    self.start_date_formatted = self.start_date.strftime('%a, %b. %d, %Y')
  end

  def end_date_format
    self.end_date_formatted = self.end_date.strftime('%a, %b. %d, %Y')
  end
end
