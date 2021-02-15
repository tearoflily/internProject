require 'rails_helper'

RSpec.describe "従業員ユーザー検証", type: :system do
  let(:customer1){FactoryBot.create(:user)}
  let!(:customer2){ FactoryBot.create(
      :user, name: "次郎", name_kana: "ジロウ", email: "jiro@example.com", tellnumber: "090-1111-1111", employee:false
  )}  
  let!(:employee1){ FactoryBot.create(
    :user, name: "花子", name_kana: "ハナコ", email: "hanako@example.com", tellnumber: "090-2222-1111", employee:true
  )}   
  let!(:employee2){ FactoryBot.create(
    :user, name: "たま", name_kana: "タマ", email: "tama@example.com", tellnumber: "090-3333-1111", employee:true
  )}   

  describe "表示検証" do
    before do
      visit employee_users_path
    end
    it "画面が表示される。" do
      expect(page).to have_content 'お客様一覧' 
      expect(page).to have_content '従業員一覧' 
    end
    it "お客様情報削除検証" do
        click_on "delete_user_customer_button#{customer2.id}"
        expect{
            expect(page.accept_confirm).to eq "削除しますか？"
            expect(page).to have_content "削除しました。"
            } 
    end
    it "従業員情報削除検証" do
        click_on "delete_user_employee_button#{employee2.id}"
        expect{
            expect(page.accept_confirm).to eq "削除しますか？"
            expect(page).to have_content "削除しました。"
            } 
    end
    it "新規登録ができること" do
      User.create(name:"山田 太郎", name_kana:"ヤマダ タロウ",tellnumber: "050-5555-5555", email:"yamada@email.com",password:"password", password_confirmation: "password", employee: "true")
        #ユーザー新規作成ページへ移動
        visit new_employee_user_path
        fill_in "user_name", with: "山田 太郎"
        fill_in "user_name_kana", with: "ヤマダ タロウ"
        fill_in "user_tellnumber", with: "050-5555-5555"
        fill_in "user_email", with: "syamada@email.com"
        fill_in "user_password", with: "password"
        fill_in "user_password_confirmation", with: "password"
        click_button '新規作成'
        expect(page).to have_content "新規登録に成功しました。"
      end 
  end 

  # describe '編集画面' do
  #   it '登録内容の変更' do
  #     visit login_path
  #     fill_in "session_email", with: "hanako@example.com"
  #     fill_in "session_password", with: "password"
  #     click_button 'ログイン'
      
  #     # User編集画面を開く
  #     click_link '会員メニュー'
  #     click_link '会員ページ'
  #     click_on "変更する"

  #     fill_in "user_tellnumber", with: "03-5555-5555"
  #     fill_in "user_email", with: "flower@email.com"
  #     click_on '更新'
      
  #     expect(page).to have_content '従業員情報を更新しました。'
  #     expect(page).to have_content '花子'
  #     expect(page).to have_content 'ハナコ'
  #     expect(page).to have_content '03-5555-5555'
  #     expect(page).to have_content 'flower@email.com'
  #   end
  # end
  

end
