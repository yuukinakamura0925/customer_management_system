# データをどう作るかの定義をしている部分
FactoryBot.define do
  factory :menu do
    name { 'beer' }
    price { 500 }

    association :category 
  end
end