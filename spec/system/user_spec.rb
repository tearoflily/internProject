require 'rails_helper'

RSpec.describe 'Users', type: :system do
 it "新規登録ができること" do
  User.create(name:"手巣 斗", name_kana:"テスト",tellnumber: "090-0900-0900", email:"sample@email.com",password:"password", password_confirmation: "password", employee: "false")
    #ユーザー新規作成ページへ移動
    visit new_customer_user_path
    fill_in "name", with: "手巣 斗"
    fill_in "name_kana", with: "テスト"
    fill_in "tellnumber", with: "090-0900-0900"
    fill_in "email", with: "sample@email.com"
    fill_in "password", with: "password"
    fill_in "password_confirmation", with: "password"
    click_button '新規作成'
    expect(page).to have_content "新規作成に成功しました。"
  end

end
