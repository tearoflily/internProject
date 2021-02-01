require 'rails_helper'

describe "売上検証", type: :system do
  let!(:user){ FactoryBot.create(
      :user, name: '前田', name_kana: 'マエダ', email: 'maeda@example.com',
      tellnumber: '090-1233-3222',employee: false,
      password: 'password', password_confirmation: 'password'
  )}
  let!(:item){ FactoryBot.create(:item, name: 'いなだ', category: ' bigger')}

  let!(:order1){ FactoryBot.create(
      :order, name: 'いなだ', price: 500, process: '刺し身', num: 5, status: :delivery,
      order_date: Date.today, order_time:DateTime.now, user_id: user.id
  )}
  let!(:order2){ FactoryBot.create(
      :order, name: 'いなだ', price: 500, process: '刺し身', num: 1, status:  :delivery,
      order_date: Date.today + 1, order_time:DateTime.now, user_id: user.id
  )}
  ###################################################################################################
  describe "ページが表示される" do
     before do
        visit employee_product_sales_amount_path(item)
     end 
     it "表示される" do
        expect(page).to have_content 'いなだ売上管理' 
     end
     context "テーブルの内容が表示されているか" do
        it "表示される" do
            expect(page).to have_content '今月売上構成比' 
        end
        it "日割り売上合計が正しく表示されているか？" do
            expect(page).to have_content '2500' 
            expect(page).to have_content '500' 
        end
        it "月売上合計及び日割りに売上比率ただしいか？" do
            expect(page).to have_content '3000' 
            expect(page).to have_content '16' 
        end
     end
     context "前月ボタンでページ移動できるか" do
         it "前月の表示がなされている" do
             click_on "前月"
             expect(page).to have_content '【1月売上】' 
         end
         
     end
     
  end
  
end
