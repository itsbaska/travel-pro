class Receipt < ApplicationRecord
  belongs_to :purchaser, class_name: "User"
  belongs_to :trip
  validates :store, :total, presence: true
  validates_numericality_of :total, :greater_than => 0
end
