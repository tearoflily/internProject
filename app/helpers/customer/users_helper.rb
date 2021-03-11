module Customer::UsersHelper

  def orders_names(orders)
    items_name = orders.pluck(:name).uniq
    if items_name.count == 1
      return items_name[0]
    elsif items_name.count == 2
      return items_name[0] + '、' + items_name[1]
    elsif items_name.count == 3
      return items_name[0] + '、' + items_name[1] + '、' + items_name[2]
    elsif items_name.count > 3
      now_items_count = (items_name.count.to_i) - 2
      return items_name[0] + '、' + items_name[1] + '、' + items_name[2] + '他' + now_items_count.to_s + '点'
    else
    end
  end
  
end
