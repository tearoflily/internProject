require 'rails_helper'

RSpec.describe "商品検証", type: :system do
  let!(:item){ FactoryBot.create(:item)}   
  let!(:item2){ FactoryBot.create(:item, name: '金目鯛')}

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
  ###############################################################################
  describe "商品編集検証" do
    before do
   
      visit edit_employee_item_path(item2)
    end
    it "新規登録画面が表示される。" do
      expect(page).to have_content '金目鯛編集' 
    end

    context "商品編集処理" do
      it "無事編集される" do
        fill_in "item[info]",	with: "上品な味がします。" 
        click_on '更新する'
        expect(page).to have_content  '金目鯛を編集しました。'
      end

      it "名前空欄時バリデーション起動" do
        fill_in "item[name]",	with: "" 
        click_on '更新する'
        expect(page).to have_content  '商品名を入力してください'
      end

      it "同じ名前登録時バリデーション起動" do
        fill_in "item[name]",	with: "さば" 
        click_on '更新する'
        expect(page).to have_content  '商品名はすでに存在します'
      end
    end
  end
 ###############################################################################
  describe "商品詳細画面" do
      before do
        visit employee_item_path(item2)
      end
      it "詳細画面が表示される。" do
        expect(page).to have_content '金目鯛詳細' 
      end
  end 
   ###############################################################################
   describe "削除機能" do
      before do
        visit employee_items_path
      end
      it "削除される。" do
        click_on "delete_button#{item.id}"
        expect{
          expect(page.accept_confirm).to eq "削除しますか？"
          expect(page).to have_content "削除しました。"
          }
      end
   end 
   ########################################################################################
   describe "複数登録" do
    before do
     visit  new_employee_product_multiple_path
    end
    it "表示される。" do
      expect(page).to have_content "商品複数登録" 
    end
    context "ページ機能検証" do
      it "＋ボタンでマイナスボタン出現" do
        click_on "＋"
        expect(page).to have_content "ー" 
      end
      it "フォームが一つの時はーボタンは表示されない" do
        click_on "ー"
        expect(page).to have_no_selector ".ml-down" 
      end
      it "登録される" do
        click_on "＋"
        fill_in "form_item_collection[items_attributes][0][name]",	with: "岩魚" 
        fill_in "form_item_collection[items_attributes][1][name]",	with: "ヤマメ" 
        click_on '登録'
        expect(page).to have_content  '登録しました。'
        
      end
    end
  end 
###################################################################################################
    
end
