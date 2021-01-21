class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {maximum: 10}
  validates :price, presence: true, :numericality => { :greater_than => 0 } 
  validates :stock, presence: true, :numericality => { :greater_than => 0 } 
  scope :datasort, -> { order(id: :DESC)}

  #合計金額
  def total
    price * stock
  end
  
  def self.stock_price_update(params)
    params.each do |id, item|
      product = find id
      product.price = item[:price]
      product.stock = item[:stock]
      product.save 
    end
  end

end
