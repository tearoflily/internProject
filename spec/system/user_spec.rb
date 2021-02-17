require 'rails_helper'

RSpec.describe 'Users', type: :system do

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
        expect(page).to have_content ""
    end
  end

  describe "ログイン" do
    @user = User.create(name:"森 太郎", name_kana:"モリ タロウ",tellnumber: "050-5555-5555", email:"mori@email.com",password:"password", password_confirmation: "password", employee: "false")
    it "ログインできること。" do
      visit login_path
      fill_in "session_email", with: "mori@email.com"
      fill_in "session_password", with: "password"
      click_button 'ログイン'
      expect(page).to have_content ""
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
