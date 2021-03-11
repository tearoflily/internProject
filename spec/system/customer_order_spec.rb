require 'rails_helper'

RSpec.describe 'customer_order', type: :system do
  let(:order){{order_date: "2021/03/05", order_time: "16:00", price: "1800", order_id: "30"}}
  describe "order検証" do
    before do
      visit customer_order_path(order) 
    end
    it "注文内容が表示される事" do
      expect(page).to have_content "注文を確定しました"
      expect(page).to have_content "お受け取り日：2021年03月05日(金）"
      expect(page).to have_content "お受け取り時間：16:00"
      expect(page).to have_content "金額：1800円"
    end
  end

end