class Receipt < ApplicationRecord
  # before_save :float_budget
  before_save :receipt_purchaser
  belongs_to :purchaser, class_name: "User"
  belongs_to :trip
  validates :photo, presence: true
  validates :store, :total, presence: true
  validates_numericality_of :total, :greater_than => 0

  def receipt_purchaser
    self.purchaser_name = self.purchaser.full_name
  end

  # def float_budget
  #   self.budget = self.budget.round(2)
  # end
end
