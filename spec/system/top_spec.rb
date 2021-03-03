require 'rails_helper'

RSpec.describe 'Top', type: :system do

  describe "TOP画面表示" do
    let!(:product){ FactoryBot.create(:product, name: 'まだい')}
    let!(:item){ FactoryBot.create(:item, name: 'まだい')}  
    it "項目が表示されていること" do
      travel_to Time.zone.local(2021, 03, 04) do
        visit top_show_path
        expect(page).to have_content "まだい"
        expect(page).to have_no_selector ".soldout" 
      end
    end
  end

  # describe "TOP画面表示" do
  #   let!(:product){ FactoryBot.create(:product, name: 'まだい', stock: '1')}
  #   let!(:item){ FactoryBot.create(:item, name: 'まだい')}  
  #   before do
  #     visit top_show_path
  #   end
  #   it "soldoutの表示" do
  #     travel_to Time.zone.local(2021, 03, 04) do
  #       visit top_show_path
  #       expect(page).to have_selector ".soldout" 
  #     end
  #   end
  # end

  describe "TOP画面表示（何もない時）" do
    it "メッセージが表示されていること" do
      travel_to Time.zone.local(2021, 03, 04) do
        visit top_show_path
        expect(page).to have_content "本日商品はありません"
      end
    end
  end

  describe "TOP画面表示（時間外の時）" do
    before do
      travel_to(Time.new(2021, 3, 4, 12, 0, 0))
    end
    it "メッセージが表示されていること" do
      visit top_show_path
      expect(page).to have_content "ただいま準備中です。もうしばらくお待ちください。"
    end
  end

end