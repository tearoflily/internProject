require 'rails_helper'

RSpec.describe "商品加工検証", type: :system do
  let!(:item){ FactoryBot.create(:item)}

  describe "ページアクセス確認" do
    it "ページにアクセスできているか？" do
       visit new_employee_processing_path({params:{item_id: item}}) 
       expect(page).to have_content 'さば加工法登録' 
    end  
  end
  ##############################################################
  describe "登録処理" do
    before do
      visit new_employee_processing_path({params:{item_id: item}}) 
      find("option[value='kirimi']").select_option 
      click_on '追加'   
    end
    it "登録される" do
      expect(page).to have_content '商品加工法を登録しました。' 
    end
    it "テーブルが形成される" do
      expect(page).to have_content '加工法' 
    end
    

  end
  
  
end
