require 'rails_helper'

describe 'List' do
  it '全てのメニューを取得する' do
    
    FactoryBot.create_list(:menu, 10)

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
    menu = FactoryBot.create(
      :menu, 
      name: "beer", 
      price: 500,
    )

    get "/menus/#{menu.id}"
    json = JSON.parse(response.body)

    # リクエスト成功を表す200が返ってきたか確認する。
    expect(response.status).to eq(200)

      # 要求した特定のポストのみ取得した事を確認する
    expect(json['name']).to eq(menu.name)
    expect(json['price']).to eq(menu.price)
  end
end