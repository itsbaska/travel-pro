class Travelgrouping < ApplicationRecord
  belongs_to :trip
  has_many :outbounds
  has_many :inbounds
  belongs_to :traveller, class_name: "User"
end
