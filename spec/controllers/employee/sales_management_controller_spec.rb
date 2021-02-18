require 'rails_helper'

RSpec.describe Employee::SalesManagementsController, type: :controller do
  describe 'エクセルエクスポート' do
    context 'formatがxlsxの場合' do
      before do
        get :index, format: :xlsx
      end

      it 'ファイル名が正しいこと' do
        expect(response.headers["Content-Disposition"]).to include "売上.xlsx"
      end
    end
  end
end
