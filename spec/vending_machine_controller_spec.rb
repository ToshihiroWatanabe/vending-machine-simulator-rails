require 'rails_helper'

RSpec.describe 'vending_machine_controllerのテスト', type: :request do
  context 'ホーム画面が正しく表示される' do
    before do
      get '/'
    end
    it 'リクエストは200 OKとなること' do
      expect(response.status).to eq 200
    end
    it '見出しが正しく表示されていること' do
      expect(response.body).to include('自動販売機シミュレーター')
    end
  end
end
