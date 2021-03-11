require 'rails_helper'

RSpec.describe 'Users', type: :system do

  describe "ログイン" do
    @user = User.create(name:"森 太郎", name_kana:"モリ タロウ",tellnumber: "050-5555-5555", email:"mori@email.com",password:"password", password_confirmation: "password", employee: "false")
    it "ログインできること。" do
      visit login_path
      fill_in "session_email", with: "mori@email.com"
      fill_in "session_password", with: "password"
      click_button 'ログイン'
      expect(page).to have_content "ログインしました"
    end
  end

  describe "ログアウト" do
    @user = User.create(name:"森 太郎", name_kana:"モリ タロウ",tellnumber: "050-5555-5555", email:"mori@email.com",password:"password", password_confirmation: "password", employee: "false")
    it "ログインできること。" do
      visit login_path
      fill_in "session_email", with: "mori@email.com"
      fill_in "session_password", with: "password"
      click_button 'ログイン'
      expect(page).to have_content "ログインしました"

      click_link 'ログアウト'
      expect(page).to have_content "ログアウトしました"

    end
  end

  describe "ログイン" do
    before do
      visit new_customer_user_path
    end
    it "新規登録ができること" do
        fill_in "user_name", with: "田森 太郎"
        fill_in "user_name_kana", with: "モリタ タロウ"
        fill_in "user_tellnumber", with: "090-3355-3355"
        fill_in "user_email", with: "tamori@email.com"
        fill_in "user_password", with: "password"
        fill_in "user_password_confirmation", with: "password"
        click_button '新規作成'
        expect(page).to have_content "新規登録に成功しました。"
    end
  end

  describe '編集画面' do
    before do
      User.create(
        name: "林 太郎", name_kana: "ハヤシ タロウ", tellnumber: "080-5555-5555", email: "hayashi@email.com", password:"password", password_confirmation: "password", employee: "false"
      )
    end
    it '登録内容の変更' do
      visit login_path
      fill_in "session_email", with: "hayashi@email.com"
      fill_in "session_password", with: "password"
      click_button 'ログイン'
      
      # User編集画面を開く
      click_link 'マイページ'
      click_on "変更する"

      fill_in "user_tellnumber", with: "03-5555-5555"
      fill_in "user_email", with: "tarohaya@email.com"
      click_button '更新'
      
      expect(page).to have_content 'お客様情報を更新しました。'
      expect(page).to have_content '林 太郎'
      expect(page).to have_content 'ハヤシ タロウ'
      expect(page).to have_content '03-5555-5555'
      expect(page).to have_content 'tarohaya@email.com'
    end
  end
end

RSpec.describe "受付中の注文・注文履歴", type: :system do
  describe "ログインしたお客様の注文中の内容が表示される" do
    let!(:user){ FactoryBot.create(
      :user, name: 'テスト20210307', name_kana: 'ニーゼロニーイチ', email: '2021@example.com',
      tellnumber: '090-2021-0307', employee: false,
      password: 'password', password_confirmation: 'password'
    )}
    let!(:item1){ FactoryBot.create(:item, name: 'たい', category: 'white')}
    let!(:item2){ FactoryBot.create(:item, name: 'ふぐ', category: 'white')}
    let!(:item3){ FactoryBot.create(:item, name: 'ひらめ', category: 'white')}
    let!(:item4){ FactoryBot.create(:item, name: 'ぶり', category: 'bigger')}
    let!(:item5){ FactoryBot.create(:item, name: 'いか', category: 'octopassquid')}
    let!(:item5){ FactoryBot.create(:item, name: 'たこ', category: 'octopassquid')}
    let!(:item6){ FactoryBot.create(:item, name: 'いわし', category: 'blue')}
    let!(:order1){FactoryBot.create(
        :order, name: 'たい', price: 300, process: 'sasimi', num: 3, status: :processed,
        order_date: '2021-02-25', order_date_details: '2021-02-25 14:30:00', order_time: '2021-02-26 13:30:00', user_id: user.id
    )}
    let!(:order2){FactoryBot.create(
      :order, name: 'ふぐ', price: 250, process: 'kirimi', num: 2, status: :processed,
      order_date: '2021-02-25', order_date_details: '2021-02-25 14:30:00', order_time: '2021-02-26 13:30:00', user_id: user.id
    )}
    let!(:order3){FactoryBot.create(
      :order, name: 'ひらめ', price: 240, process: 'flay', num: 1, status: :processed,
      order_date: '2021-02-25', order_date_details: '2021-02-25 14:30:00', order_time: '2021-02-26 13:30:00', user_id: user.id
    )}
    let!(:order4){FactoryBot.create(
      :order, name: 'ぶり', price: 210, process: 'nimono', num: 2, status: :processed,
      order_date: '2021-02-26', order_date_details: '2021-02-26 16:30:00', order_time: '2021-02-27 12:20:00', user_id: user.id
    )}
    let!(:order5){FactoryBot.create(
      :order, name: 'たこ', price: 230, process: 'sasimi', num: 2, status: :processed,
      order_date: '2021-02-26', order_date_details: '2021-02-26 16:30:00', order_time: '2021-02-27 12:20:00', user_id: user.id
    )}
    let!(:order6){FactoryBot.create(
      :order, name: 'ひらめ', price: 240, process: 'flay', num: 1, status: :processed,
      order_date: '2021-02-26', order_date_details: '2021-02-26 16:30:00', order_time: '2021-02-27 12:20:00', user_id: user.id
    )}
    let!(:order7){FactoryBot.create(
      :order, name: 'ふぐ', price: 250, process: 'flay', num: 2, status: :delivery,
      order_date: '2021-02-23', order_date_details: '2021-02-23 11:30:00', order_time: '2021-02-24 13:40:00', user_id: user.id
    )}
    let!(:order8){FactoryBot.create(
      :order, name: 'ひらめ', price: 240, process: 'sasimi', num: 1, status: :delivery,
      order_date: '2021-02-23', order_date_details: '2021-02-23 11:30:00', order_time: '2021-02-24 13:40:00', user_id: user.id
    )}
    let!(:order8){FactoryBot.create(
      :order, name: 'いわし', price: 260, process: 'sasimi', num: 1, status: :delivery,
      order_date: '2021-02-23', order_date_details: '2021-02-23 11:30:00', order_time: '2021-02-24 13:40:00', user_id: user.id
    )}
    let!(:order9){FactoryBot.create(
      :order, name: 'ぶり', price: 210, process: 'nimono', num: 2, status: :delivery,
      order_date: '2021-02-23', order_date_details: '2021-02-23 11:30:00', order_time: '2021-02-24 13:40:00', user_id: user.id
    )}
    let!(:order10){FactoryBot.create(
      :order, name: 'たこ', price: 230, process: 'sasimi', num: 2, status: :delivery,
      order_date: '2021-02-23', order_date_details: '2021-02-23 11:30:00', order_time: '2021-02-24 13:40:00', user_id: user.id
    )}

    before do
      visit login_path
      fill_in "session_email", with: "2021@example.com"
      fill_in "session_password", with: "password"
      click_button 'ログイン'
      visit customer_user_path(user)
    end

    context "表示されている合計金額は正しいか" do
      it "表示される" do
        expect(page).to have_content '1,640'
        expect(page).to have_content '1,120'
      end
    end

    context "表示されている注文履歴はログイン中のユーザーのものか" do
      it "表示される" do
        click_on 'ご注文履歴はこちらから'
        expect(page).to have_content('お受け取り済み').or have_content('受取済')
      end
    end
    
    context "表示されている注文履歴は受け取り済みステータスの注文か" do
      it "表示される" do
        click_on 'ご注文履歴はこちらから'
        expect(page).to have_content 'ふぐ、いわし、ぶり他2点'
      end
    end
  end

end

