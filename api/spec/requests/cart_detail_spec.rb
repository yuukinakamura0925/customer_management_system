require 'rails_helper'

RSpec.describe "CartDetails", type: :request do
  describe 'Create', type: :request do
    it 'カートディテールを新規追加する' do
      # ログ出力
      # ActiveRecord::Base.logger = Logger.new(STDOUT)

      # テストデータの準備
      customer = FactoryBot.create(:customer)
      cart = FactoryBot.create(:cart, customer_id: customer.id)
      category = FactoryBot.create(:category)
      menu = FactoryBot.create(:menu, category_id: category.id)

      # パラメータ
      cart_detail_params = { 
       menu_id: menu.id,
       cart_id: cart.id,
       qty: 1,
       price: 100
      }

      # リクエスト成功を表す200が返ってきていること
      # レコードが1つ追加されていること
      expect do
        post "/carts/#{cart.id}/cart_details", params: cart_detail_params
        expect(response.status).to eq(200)
      end.to change {CartDetail.count}.by(1)
    end
  end

  describe 'List' do
    it '全てのカートディテールを取得する' do
      # ActiveRecord::Base.logger = Logger.new(STDOUT)
      customer = FactoryBot.create(:customer)
      cart = FactoryBot.create(:cart, customer_id: customer.id)
      category = FactoryBot.create(:category)
      menu = FactoryBot.create(:menu, category_id: category.id)
      
      FactoryBot.create_list(:cart_detail, 10, menu_id: menu.id, cart_id: cart.id )

      get "/carts/#{cart.id}/cart_details"
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)

      # # 正しい数のデータが返されたか確認する。
      expect(json.length).to eq(10)
    end
  end

  describe 'GET' do
    it 'カートディテールを1件取得する' do
      # ActiveRecord::Base.logger = Logger.new(STDOUT)

      customer = FactoryBot.create(:customer)
      cart = FactoryBot.create(:cart, customer_id: customer.id)
      category = FactoryBot.create(:category)
      menu = FactoryBot.create(:menu, category_id: category.id)

      cart_detail = FactoryBot.create(
        :cart_detail, 
        menu_id: menu.id,
        cart_id: cart.id,
        qty: 1,
        price: 100
      )

      get "/carts/#{cart.id}/cart_details/#{cart_detail.id}"
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)

        # 要求した特定のポストのみ取得した事を確認する
      expect(json['menu_id']).to eq(cart_detail.menu_id)
      expect(json['cart_id']).to eq(cart_detail.cart_id)
      expect(json['qty']).to eq(cart_detail.qty)
      expect(json['price']).to eq(cart_detail.price)
    end
  end

  describe 'Update' do
    it 'カートディテールを更新する' do
      # ログ出力
      # ActiveRecord::Base.logger = Logger.new(STDOUT)

      # テストデータの準備
      customer = FactoryBot.create(:customer)
      cart = FactoryBot.create(:cart, customer_id: customer.id)
      category = FactoryBot.create(:category)
      menu = FactoryBot.create(:menu, category_id: category.id)

      cart_detail = FactoryBot.create(
        :cart_detail, 
        menu_id: menu.id,
        cart_id: cart.id,
        qty: 1,
        price: 100
      )

      # パラメータ
      cart_detail_params = { 
        price: 550,
      }

      ## API実行
      put "/carts/#{cart.id}/cart_details/#{cart_detail.id}", params: cart_detail_params

      ## レスポンスをjson形式に変換
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する
      expect(response.status).to eq(200)

      # データが更新されたか確認する
      expect(json['data']['price']).to eq(550)
    end
  end
  describe 'Delete' do
    it 'カートディテールを削除する' do
      # ログ出力
      # ActiveRecord::Base.logger = Logger.new(STDOUT)

      # テストデータの準備
      customer = FactoryBot.create(:customer)
      cart = FactoryBot.create(:cart, customer_id: customer.id)
      category = FactoryBot.create(:category)
      menu = FactoryBot.create(:menu, category_id: category.id)
      cart_detail = FactoryBot.create(
        :cart_detail, 
        menu_id: menu.id,
        cart_id: cart.id,
        qty: 1,
        price: 100
      )

      # リクエスト成功を表す200が返ってきていること
      # レコードが1つ削除されていること
      expect do
        delete "/carts/#{cart.id}/cart_details/#{cart_detail.id}"
        expect(response.status).to eq(200)
      end.to change {CartDetail.count}.by(-1)
    end
  end
  
end
