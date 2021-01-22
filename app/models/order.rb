class Order < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: {maximum: 10}
  validates :price, presence: true, :numericality => { :greater_than => 0 } 
  validates :num, presence: true, :numericality => { :greater_than => 0 } 
  validates :order_time, presence: true

  scope :timeSort, -> { order(order_time: :asc)}
 
end
