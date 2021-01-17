require 'rails_helper'

describe "商品検証", type: :system do
  let!(:item){ FactoryBot.create(:item)}   

  describe "新規登録検証" do
    before do
      visit new_employee_item_path
    end
    it "新規登録画面が表示される。" do
      expect(page).to have_content '新規商品登録' 
    end

    context "新規登録処理" do
      it "無事登録される" do
        fill_in "item[name]",	with: "いわし" 
        fill_in "item[info]",	with: "青魚" 
        click_on '登録する'
        expect(page).to have_content  'いわしを登録しました。'
      end

      it "名前空欄時バリデーション起動" do
        fill_in "item[name]",	with: "" 
        click_on '登録する'
        expect(page).to have_content  '商品名を入力してください'
      end

      it "同じ名前登録時バリデーション起動" do
        fill_in "item[name]",	with: "さば" 
        click_on '登録する'
        expect(page).to have_content  '商品名はすでに存在します'
      end
      
    end
  end
end
