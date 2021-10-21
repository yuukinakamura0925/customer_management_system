require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe 'Create', type: :request do
    it 'カテゴリーを新規追加する' do
      # ログ出力
      ActiveRecord::Base.logger = Logger.new(STDOUT)

      # テストデータの準備

      # パラメータ
      category_params = { 
        name: "beer",
      }

      # リクエスト成功を表す200が返ってきていること
      # レコードが1つ追加されていること
      expect do
        post "/categories", params: category_params
        expect(response.status).to eq(200)
      end.to change {Category.count}.by(1)
    end
  end

  describe 'List' do
    it '全てのカテゴリーを取得する' do
      ActiveRecord::Base.logger = Logger.new(STDOUT)
      FactoryBot.create_list(:category, 10)

      get '/categor'
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)

      # # 正しい数のデータが返されたか確認する。
      expect(json.length).to eq(10)
    end
  end

  describe 'GET' do
    it 'カテゴリーを1件取得する' do
      ActiveRecord::Base.logger = Logger.new(STDOUT)

      category = FactoryBot.create(
        :category, 
        name: "beer",
      )

      get "/categories/#{category.id}"
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)

        # 要求した特定のポストのみ取得した事を確認する
      expect(json['name']).to eq(category.name)
    end
  end

  describe 'Update' do
    it 'カテゴリーを更新する' do
      # ログ出力
      ActiveRecord::Base.logger = Logger.new(STDOUT)

      # テストデータの準備
      category = FactoryBot.create(
        :category, 
        name: "food",
      )

      # パラメータ
      category_params = { 
        name: "food",
      }

      ## API実行
      put "/categories/#{category.id}", params: category_params

      ## レスポンスをjson形式に変換
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する
      expect(response.status).to eq(200)

      # データが更新されたか確認する
      expect(json['data']['name']).to eq("food")
    end
  end

  describe 'Delete' do
    it 'カテゴリーを削除する' do
      # ログ出力
      ActiveRecord::Base.logger = Logger.new(STDOUT)

      # テストデータの準備
      
      category = FactoryBot.create(
        :category, 
        name: "beer",
      )

      # リクエスト成功を表す200が返ってきていること
      # レコードが1つ削除されていること
      expect do
        delete "/categories/#{category.id}"
        expect(response.status).to eq(200)
      end.to change {Category.count}.by(-1)
    end
  end
end
