class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {maximum: 10}
  validates :price, presence: true, :numericality => { :greater_than => 0 } 
  validates :stock, presence: true, :numericality => { :greater_than => 0 } 
  scope :datasort, -> { order(id: :DESC)}
 
end
