class Trip < ApplicationRecord
  has_many :travelgroupings
  has_many :receipts
  belongs_to :organizer, class_name: "User"
  has_many :travellers,  -> { distinct }, through: :travelgroupings, source: :traveller
  has_many :inbound_flights, through: :travelgroupings, source: :inbounds
  has_many :outbound_flights, through: :travelgroupings, source: :outbounds
  validates :name, :location, :budget, :start_date, :end_date, presence: true
  validates_numericality_of :budget, :greater_than => 0

  validate :check_start_date, :check_end_date

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

  def check_start_date
    if self.start_date.nil?
      false
    elsif self.start_date >= Date.today
      true
    else
      false
      errors.add(:start_date, "must not be in the past")
    end
  end

  def check_end_date
    if self.end_date.nil?
      false
    elsif self.end_date >= Date.today
      true
    else
      false
      errors.add(:end_date, "must not be in the past")
    end
  end
end
