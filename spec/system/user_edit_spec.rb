require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let!(:user_1){ FactoryBot.create(
    :user, name: "山田 太郎", name_kana: "ヤマダ タロウ", tellnumber: "050-5555-5555", email: "yamada@email.com", password:"password", password_confirmation: "password", employee: "false"
  )}
    before do
      visit login_path
      fill_in "session_email", with: "yamada@email.com"
      fill_in "session_password", with: "password"
      click_button 'ログイン'
    end
  
  describe '編集画面' do
    context 'ログインしている時' do
     let(:login_user){ user_1 }
    
      it '登録内容の変更' do
        # User編集画面を開く
        
        visit edit_customer_user_path(user_1.id)

        fill_in "user_tellnumber", with: "03-5555-5555"
        fill_in "user_email", with: "taro@email.com"

        click_button '更新'

        expect(page).to have_content 'お客様情報を更新しました。'
        expect(page).to have_content '山田 太郎'
        expect(page).to have_content 'ヤマダ タロウ'
        expect(page).to have_content '03-5555-5555'
        expect(page).to have_content 'taro@email.com'
      end
    end
  end
end
