require 'rails_helper'

describe "オーダー検証", type: :system do
  before do
      
    user =User.create(
      name: 'たろう', 
      name_kana: 'タロウ', 
      tellnumber: '090-1111-1112',
      email: 'testSpec2@example.com',
      employee: false,
      password: "123456789",
      password_confirmation: '123456789'
    )
    user2 =User.create(
      name: 'たろう2', 
      name_kana: 'タロウ2', 
      tellnumber: '090-1111-1132',
      email: 'testSpec22@example.com',
      employee: false,
      password: "123456789",
      password_confirmation: '123456789'
    )
      Order.create(
        name: 'さんま',
        price: 100,
        process: '刺し身',
        num: 5,
        order_date: Date.today,
        order_time: Time.local(
          Time.now.year,
          Time.now.month,
          Time.now.day,
          Time.now.hour ,
          30,0),
          user_id: user.id
      )
      18.times do |i|
        Order.create(
          name: "食品#{i}",
          price: 100*i,
          process: '刺し身',
          num: 5,
          order_date: Date.today,
          order_time: DateTime.now,
          user_id: user2.id
        )
      end
      @order5 = Order.last
  end


  describe "一覧ページ表示検証" do
    before do
      visit employee_orders_path
    end
    it "ページが表示される。" do
        expect(page).to  have_content "注文状況確認"
    end

    it "お客様詳細画面表示" do
      click_on "たろう"
      expect(page).to have_content "たろうさん注文状況"
    end
    
    it "注文状況変更モーダル表示" do
      click_on "edit-modal#{@order5.id}"
      expect(page).to have_content "申請中17件"  
    end

    it "更新される" do
      click_on "edit-modal#{@order5.id}"
      click_on "加工済みに変更"
      expect(page).to have_content "注文状況を更新しました。"  
    end
    
    it "アコーディオンの表示" do
      click_on "edit-modal#{@order5.id}"
      click_on "bt0"
      expect(page).to have_content "【状況変更ボタンおしてください】" 
      
    end
    

    

  end
end
