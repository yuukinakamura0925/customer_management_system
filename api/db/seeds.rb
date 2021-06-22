Customer.destroy_all
Menu.destroy_all
Category.destroy_all
Order.destroy_all
OrderDetail.destroy_all


category1 = Category.create!(name: "ドリンク")
category2 = Category.create!(name: "フード")

Menu.create!(name: "ハラディンカ", price: 780, category_id: category1.id)
Menu.create!(name: "ナドバクラット", price: 780, category_id: category1.id)
Menu.create!(name: "ハイボール", price: 580, category_id: category1.id)
Menu.create!(name: "鴨肉のゴロゴロ低温焼き", price: 880, category_id: category2.id)
Menu.create!(name: "オレガノビーフのローストビーフ", price: 880, category_id: category2.id)
Menu.create!(name: "ミックスナッツ", price: 480, category_id: category2.id)

puts "初期データの投入に成功しました！"
