require 'rails_helper'

RSpec.describe "Customers", type: :request do

  describe 'Create', type: :request do
    it 'カスタマーを新規追加する' do
      # ログ出力
      # ActiveRecord::Base.logger = Logger.new(STDOUT)

      # テストデータの準備

      # パラメータ
      customer_params = { 
        name: "tarou",
        age: 20,
        sex: "man",
        memo: "test test test test test",
      }

      # リクエスト成功を表す200が返ってきていること
      # レコードが1つ追加されていること
      expect do
        post "/customers", params: customer_params
        expect(response.status).to eq(200)
      end.to change {Customer.count}.by(1)
    end
  end

  describe 'List' do
    it '全てのカスタマーを取得する' do
      # ActiveRecord::Base.logger = Logger.new(STDOUT)
      FactoryBot.create_list(:category, 1)
      FactoryBot.create_list(:customer, 10)

      get '/customers'
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)

      # # 正しい数のデータが返されたか確認する。
      expect(json.length).to eq(10)
    end
  end

  describe 'GET' do
    it 'カスタマーを1件取得する' do
      # ActiveRecord::Base.logger = Logger.new(STDOUT)

      FactoryBot.create_list(:category, 1)
      customer = FactoryBot.create(
        :customer, 
        name: "tarou",
        age: 20,
        sex: "man",
        memo: "test test test test test"
      )

      get "/customers/#{customer.id}"
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)

        # 要求した特定のポストのみ取得した事を確認する
      expect(json['name']).to eq(customer.name)
      expect(json['age']).to eq(customer.age)
      expect(json['sex']).to eq(customer.sex)
      expect(json['memo']).to eq(customer.memo)
    end
  end

  describe 'Update' do
    it 'カスタマーを更新する' do
      # ログ出力
      # ActiveRecord::Base.logger = Logger.new(STDOUT)

      # テストデータの準備
      customer = FactoryBot.create(
        :customer, 
   
        name: "tarou",
        age: 20,
        sex: "man",
        memo: "test test test test test"
      )

      # パラメータ
      customer_params = { 
        age: 50,
      }

      ## API実行
      put "/customers/#{customer.id}", params: customer_params

      ## レスポンスをjson形式に変換
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する
      expect(response.status).to eq(200)

      # データが更新されたか確認する
      expect(json['data']['age']).to eq(50)
    end
  end

  describe 'Delete' do
    it 'カスタマーを削除する' do
      # ログ出力
      # ActiveRecord::Base.logger = Logger.new(STDOUT)

      # テストデータの準備
      customer = FactoryBot.create(
        :customer, 
        name: "tarou",
        age: 20,
        sex: "man",
        memo: "test test test test test"
      )

      # リクエスト成功を表す200が返ってきていること
      # レコードが1つ削除されていること
      expect do
        delete "/customers/#{customer.id}"
        expect(response.status).to eq(200)
      end.to change {Customer.count}.by(-1)
    end
  end
end
