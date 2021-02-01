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

   #曜日算出
   def self.week_set(day)
    weeks = %w[日 月 火 水 木 金 土]
    weeks[day.wday]
  end


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

  #同じ日付の合計金額

   def self.dayTotal(datas)
     days = []                              #=>日付配列
     array = []                             #=>最終的に返す配列
     datas.each do |data|
       days << data.order_date
     end
     list_days = days.uniq                  

     list_days.each do |day|
       child_array = []                     #=>日別の配列
       total_price = 0
       datas.each do |data|
        if day == data.order_date
           total_price += data.total
        end
       end 
       child_array << day
       child_array << total_price
       array << child_array
     end
     return array
   end
   

  #商品別月別算出
  
  def self.saleByProduct(param_name, param_date)
    first_day = param_date.beginning_of_month
    last_day = first_day.end_of_month
    where(name: param_name, status: :delivery).where(order_date: first_day .. last_day).order(order_date: :ASC)  
  end

   #商品別月別売上合計
  
   def self.currentMonthSales(orders)
    total = 0
    orders.map{|order| total += order.total.to_i}
    return total
   end

  #本日売上
  def self.todaySales(day)
    total = 0
    orders = where(status: :delivery).where(order_date: day).order(order_date: :DESC) 
    orders.map{|order| total += order.total.to_i}
    return total
  end
  

 
  
end
