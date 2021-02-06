require 'rails_helper'

RSpec.describe 'Users', type: :system do
 it "新規登録ができること" do
  User.create(name:"手巣 斗", name_kana:"テスト",tellnumber: "090-0900-0900", email:"sample@email.com",password:"password", password_confirmation: "password", employee: "false")
    #ユーザー新規作成ページへ移動
    visit new_customer_user_path
    fill_in "user_name", with: "手巣 斗"
    fill_in "user_name_kana", with: "テスト"
    fill_in "user_tellnumber", with: "090-0900-0900"
    fill_in "user_email", with: "sample1@email.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button '新規作成'
    expect(page).to have_content ""
  end

  describe "ログイン" do
    it "ログインできること。" do
      User.create(email:"sample@email.com",password:"password")
      visit login_path
      fill_in "session_email", with: "sample1@email.com"
      fill_in "session_password", with: "password"
      click_button 'ログイン'
      expect(page).to have_content ""
    end
  end


 
end
