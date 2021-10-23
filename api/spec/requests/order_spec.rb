require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe 'Create', type: :request do
    it 'メニューを新規追加する' do
      # ログ出力
      # ActiveRecord::Base.logger = Logger.new(STDOUT)

      # テストデータの準備
      
      customer = FactoryBot.create(:customer)
      cart = FactoryBot.create(:cart, customer_id: customer.id)

      # パラメータ
      order_params = { 
        customer_id: customer.id,
        cart_is: cart.id
      }

      # リクエスト成功を表す200が返ってきていること
      # レコードが1つ追加されていること
      expect do
        post "/orders", params: order_params
        expect(response.status).to eq(200)
      end.to change {Order.count}.by(1)
    end
  end
end
