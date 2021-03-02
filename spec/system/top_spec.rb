require 'rails_helper'

RSpec.describe 'Top', type: :system do

  describe "TOP画面表示" do
    let!(:product){ FactoryBot.create(:product, name: 'まだい')}
    let!(:item){ FactoryBot.create(:item, name: 'まだい')}  
    before do
      visit top_show_path
    end
    it "項目が表示されていること" do
        expect(page).to have_content "まだい"
        expect(page).to have_no_selector ".soldout" 
    end
  end

  describe "TOP画面表示" do
    let!(:product){ FactoryBot.create(:product, name: 'まだい', stock: '1')}
    let!(:item){ FactoryBot.create(:item, name: 'まだい')}  
    before do
      visit top_show_path
    end
    it "soldoutの表示" do
      expect(page).to have_selector ".soldout" 
    end
  end

  describe "TOP画面表示（何もない時）" do
    before do
      visit top_show_path
    end
    it "メッセージが表示されていること" do
        expect(page).to have_content "本日商品はありません"
    end
  end

end