require 'rails_helper'

describe "従業員ユーザー検証", type: :system do
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
    
  end 

end
