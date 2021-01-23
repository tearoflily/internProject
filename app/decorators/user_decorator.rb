# frozen_string_literal: true

module UserDecorator
  def check_decorator
    
  end

  #申請中のレコードある場合view表示(モーダル)
  def InOrderCheck
    todayInOrders.count >0? "<span class='bg-white p-1 text-dark ml-3'>申請中#{todayInOrders.count}件</span>".html_safe : ""
  end

  #加工済みのレコードある場合view表示(モーダル)
  def ProcessOrderCheck
    todayInProcesss.count >0? "<span class='bg-warning p-1 text-white ml-3'>加工済み#{todayInProcesss.count}件</span>".html_safe : ""
  end

   #受け渡し済み済みのレコードある場合view表示(モーダル)
   def DeliveryOrderCheck
    todayDeliveryOrders.count >0? "<span class='bg-danger p-1 text-white ml-3'>受け渡し済み#{ todayDeliveryOrders.count}件</span>".html_safe : ""
  end
  
end
