class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true 
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true


  #本日のデータ全体
  def todayOrder
    orders.where(order_date: Date.today)
  end

  #本日のデータ依頼中のデータ
  def todayInOrders
    orders.where(order_date: Date.today).where(status: :in_order)
  end

   #本日のデータ加工済みのデータ
   def todayInProcesss
    orders.where(order_date: Date.today).where(status: :processed)
  end

   #本日の渡済み済みのデータ
   def todayDeliveryOrders
    orders.where(order_date: Date.today).where(status: :delivery)
  end
  
end

