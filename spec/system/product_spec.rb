require 'rails_helper'

describe "店頭商品機能検証", type: :system do
  let!(:product){ FactoryBot.create(:product, name: '真鯛')}

  describe "ページが表示。" do
    it "ページが表示される" do 
      visit employee_products_path
      expect(page).to  have_content '店頭商品管理'    
    end
      
  end
  
 
  
end
