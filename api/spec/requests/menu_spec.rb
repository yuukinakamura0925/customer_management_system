require 'rails_helper'

RSpec.describe "Menus", type: :request do
  describe 'Create', type: :request do
    it 'メニューを新規追加する' do
      # ログ出力
      # ActiveRecord::Base.logger = Logger.new(STDOUT)

      # テストデータの準備
      category = FactoryBot.create(:category)

      # パラメータ
      menu_params = { 
        name: "beer", 
        price: 500,
        category_id: category.id,
      }

      # リクエスト成功を表す200が返ってきていること
      # レコードが1つ追加されていること
      expect do
        post "/menus", params: menu_params
        expect(response.status).to eq(200)
      end.to change {Menu.count}.by(1)
    end
  end

  describe 'List' do
    it '全てのメニューを取得する' do
      # ActiveRecord::Base.logger = Logger.new(STDOUT)
      category = FactoryBot.create(:category)
      FactoryBot.create_list(:menu, 10, category_id: category.id)

      get '/menus'
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)

      # # 正しい数のデータが返されたか確認する。
      expect(json.length).to eq(10)
    end
  end

  describe 'GET' do
    it 'メニューを1件取得する' do
      # ActiveRecord::Base.logger = Logger.new(STDOUT)

      category = FactoryBot.create(:category)
      menu = FactoryBot.create(
        :menu, 
        name: "beer", 
        price: 500,
        category_id: category.id,
      )

      get "/menus/#{menu.id}"
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)

        # 要求した特定のポストのみ取得した事を確認する
      expect(json['name']).to eq(menu.name)
      expect(json['price']).to eq(menu.price)
      expect(json['category_id']).to eq(menu.category_id)
    end
  end
  
  describe 'Update' do
    it 'メニューを更新する' do
      # ログ出力
      # ActiveRecord::Base.logger = Logger.new(STDOUT)

      # テストデータの準備
      category = FactoryBot.create(:category)
      menu = FactoryBot.create(
        :menu, 
        name: "beer", 
        price: 500,
        category_id: category.id,
      )

      # パラメータ
      menu_params = { 
        price: 550,
      }

      ## API実行
      put "/menus/#{menu.id}", params: menu_params

      ## レスポンスをjson形式に変換
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する
      expect(response.status).to eq(200)

      # データが更新されたか確認する
      expect(json['data']['price']).to eq(550)
    end
  end

  describe 'Delete' do
    it 'メニューを削除する' do
      # ログ出力
      # ActiveRecord::Base.logger = Logger.new(STDOUT)

      # テストデータの準備
      category = FactoryBot.create(:category)
      menu = FactoryBot.create(
        :menu, 
        name: "beer", 
        price: 500,
        category_id: category.id,
      )

      # リクエスト成功を表す200が返ってきていること
      # レコードが1つ削除されていること
      expect do
        delete "/menus/#{menu.id}"
        expect(response.status).to eq(200)
      end.to change {Menu.count}.by(-1)
    end
  end
end

