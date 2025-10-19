class Airport < ApplicationRecord
  has_one :room
  
  validates :code, presence: true, uniqueness: true
  validates :name, presence: true
  
  scope :search, ->(query) { where("name ILIKE ? OR code ILIKE ?", "%#{query}%", "%#{query}%").limit(10) }
end
