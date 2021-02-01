FactoryBot.define do
    factory :order do
      name { "さんま" }
      price{ 100 }
      num{ 3 }
      status{ 'in_order'}
      order_date{ Date.today }
      order_time{ DateTime.now }
      user
    end
end