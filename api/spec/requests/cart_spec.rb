require 'rails_helper'

RSpec.describe "Carts", type: :request do
  describe 'Create', type: :request do
    it 'カートを新規追加する' do
      # ログ出力
      # ActiveRecord::Base.logger = Logger.new(STDOUT)

      # テストデータの準備
      customer = FactoryBot.create(:customer)
      # パラメータ
      cart_params = { 
        customer_id: customer.id,
      }

      # リクエスト成功を表す200が返ってきていること
      # レコードが1つ追加されていること
      expect do
        post "/carts", params: cart_params
        expect(response.status).to eq(200)
      end.to change {Cart.count}.by(1)
    end
  end

  # describe 'List' do
  #   it '全てのカートを取得する' do
      # ActiveRecord::Base.logger = Logger.new(STDOUT)
  #     customer = FactoryBot.create(:customer)
  #     FactoryBot.create_list(:cart, 10, customer_id: customer.id)

  #     get '/carts'
  #     json = JSON.parse(response.body)

  #     # リクエスト成功を表す200が返ってきたか確認する。
  #     expect(response.status).to eq(200)

  #     # # 正しい数のデータが返されたか確認する。
  #     expect(json.length).to eq(10)
  #   end
  # end

  describe 'GET' do
    it 'カートを1件取得する' do
      # ActiveRecord::Base.logger = Logger.new(STDOUT)

      customer = FactoryBot.create(:customer)
      cart = FactoryBot.create(
        :cart, 
        customer_id: customer.id,
      )

      get "/carts/#{cart.id}"
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)

        # 要求した特定のポストのみ取得した事を確認する
      expect(json['data']['customer_id']).to eq(cart.customer_id)
      
    end
  end

  describe 'Delete' do
    it 'カートを削除する' do
      # ログ出力
      # ActiveRecord::Base.logger = Logger.new(STDOUT)

      # テストデータの準備
      customer = FactoryBot.create(:customer)
      cart = FactoryBot.create(
        :cart, 
        customer_id: customer.id,
      )

      # リクエスト成功を表す200が返ってきていること
      # レコードが1つ削除されていること
      expect do
        delete "/carts/#{cart.id}"
        expect(response.status).to eq(200)
      end.to change {Cart.count}.by(-1)
    end
  end

end
