require 'rails_helper'

describe "店頭商品機能検証", type: :system do
  let!(:item1){ FactoryBot.create(:item, name: '黒鯛')}
  let!(:item2){ FactoryBot.create(:item, name: '真鯛')}
  let!(:product){ FactoryBot.create(:product, name: '黒鯛')}

  describe "ページが表示。" do
    it "ページが表示される" do 
      visit employee_products_path
      expect(page).to  have_content '店頭商品管理'    
    end  
  end

  describe "新規店頭商品登録" do
    before do
      visit new_employee_product_path
      find("option[value='真鯛']").select_option 
      fill_in "product[price]",	with: "300" 
      fill_in "product[stock]",	with: "3"
      click_on "登録する"
    end
    it "店頭販売用商品が登録される。" do
      expect(page).to have_content "店頭商品真鯛を登録しました。" 
    end
  end
  
  describe "バリデーション" do
    before do
      visit new_employee_product_path
      find("option[value='黒鯛']").select_option 
      fill_in "product[price]",	with: "" 
      fill_in "product[stock]",	with: "0"
      click_on "登録する"
    end
    it "同じ名前は登録できない。" do
      expect(page).to have_content "商品名はすでに存在します" 
    end
    it "価格未入力では登録できない。" do
      expect(page).to have_content "価格を入力してください" 
    end
    it "在庫0では登録できない。" do
      expect(page).to have_content "在庫は0より大きい値にしてください" 
    end
  end
  
 
  
end
