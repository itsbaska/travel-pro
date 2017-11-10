class Trip < ApplicationRecord
  has_many :travelgroupings
  has_many :receipts
  belongs_to :organizer, class_name: "User"
  has_many :travellers, through: :travelgroupings, source: :traveller

  validates :name, :location, :budget, presence: true
  validates_numericality_of :budget, :greater_than => 0
end
