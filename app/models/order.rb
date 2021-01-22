class Order < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: {maximum: 10}
  validates :price, presence: true, :numericality => { :greater_than => 0 } 
  validates :num, presence: true, :numericality => { :greater_than => 0 } 
  validates :order_time, presence: true

  scope :timeSort, -> { where(order_date: Date.today ).order(order_time: :asc)}

  #合計金額
  def total
    num.to_i * price.to_i
  end
 
end