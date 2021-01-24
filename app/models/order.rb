class Order < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: {maximum: 10}
  validates :price, presence: true, :numericality => { :greater_than => 0 } 
  validates :num, presence: true, :numericality => { :greater_than => 0 } 
  validates :order_time, presence: true

  scope :timeSort, -> { where(order_date: Date.today ).order(order_time: :asc)}

  enum status:{
    in_order:        1, #依頼中
    processed:       2, #加工済み
    delivery:        3, #渡済み
  }

  #合計金額
  def total
    num.to_i * price.to_i
  end

  #ステータス更新
  def statusUpdate(key)
    if key == 'in_order'
      self.status = 'in_order'
      self.save
    elsif key == 'processed'
      self.status = 'processed'
      self.save
    elsif key == 'delivery'
      self.status = 'delivery'
      self.save
    end
  end

  #モーダル内のボタン当該オーダー以外を検索
  def self.otherOrders(order)
    where(user_id: order.user_id).where.not(id: order.id)
  end
  
  
 
end
