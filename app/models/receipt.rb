class Receipt < ApplicationRecord
  has_attached_file :photo, styles: {
                    medium: '1200x1200>'
                    }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  before_save :receipt_photo_url
  
  belongs_to :purchaser, class_name: "User"
  belongs_to :trip
  validates :store, :total, presence: true
  validates_numericality_of :total, :greater_than => 0

  def receipt_photo_url 
  	self.photo_url = self.photo.url(:medium)
  end 
end
