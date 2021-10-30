require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe 'Create', type: :request do
    it 'オーダーを新規追加する' do
      # ログ出力
      # ActiveRecord::Base.logger = Logger.new(STDOUT)

      # テストデータの準備
      
      customer = FactoryBot.create(:customer)
      cart = FactoryBot.create(:cart, customer_id: customer.id)

      # パラメータ
      order_params = { 
        customer_id: customer.id,
        cart_id: cart.id
      }

      # リクエスト成功を表す200が返ってきていること
      # レコードが1つ追加されていること
      expect do
        post "/orders", params: order_params
        expect(response.status).to eq(200)
      end.to change {Order.count}.by(1)
    end
  end

  describe 'List' do
    it '全てのオーダーを取得する' do
      # ActiveRecord::Base.logger = Logger.new(STDOUT)
      customer = FactoryBot.create(:customer)
      FactoryBot.create_list(:order, 10, customer_id: customer.id)

      get '/orders'
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)

      # # 正しい数のデータが返されたか確認する。
      expect(json.length).to eq(10)
    end
  end

   describe 'GET' do
    it 'オーダーを1件取得する' do
      # ActiveRecord::Base.logger = Logger.new(STDOUT)

      customer = FactoryBot.create(:customer)
      order = FactoryBot.create(
        :order, 
        customer_id: customer.id,
      )

      get "/orders/#{order.id}"
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)

        # 要求した特定のポストのみ取得した事を確認する
      expect(json["data"]['customer_id']).to eq(order.customer_id)
    end
  end
  
  # describe 'Update' do
  #   it 'オーダーを更新する' do
  #     # ログ出力
  #     # ActiveRecord::Base.logger = Logger.new(STDOUT)

  #     # テストデータの準備
  #     customer = FactoryBot.create(:customer)
  #     order = FactoryBot.create(
  #       :order, 
  #       customer_id: customer.id,
  #     )

  #     # パラメータ
  #     order_params = { 
  #       id: 777,
  #     }

  #     ## API実行
  #     put "/orders/#{order.id}", params: order_params

  #     ## レスポンスをjson形式に変換
  #     json = JSON.parse(response.body)

  #     # リクエスト成功を表す200が返ってきたか確認する
  #     expect(response.status).to eq(200)

  #     # データが更新されたか確認する
  #     expect(json['data']['id']).to eq("777")
  #   end
  # end

  describe 'Delete' do
    it 'オーダーを削除する' do
      # ログ出力
      # ActiveRecord::Base.logger = Logger.new(STDOUT)

      # テストデータの準備
      customer = FactoryBot.create(:customer)
      order = FactoryBot.create(
        :order, 
        customer_id: customer.id,
      )

      # リクエスト成功を表す200が返ってきていること
      # レコードが1つ削除されていること
      expect do
        delete "/orders/#{order.id}"
        expect(response.status).to eq(200)
      end.to change {Order.count}.by(-1)
    end
  end

end
