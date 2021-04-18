Customer.destroy_all
Menu.destroy_all
Category.destroy_all
Order.destroy_all
OrderDetail.destroy_all

customer1 = Customer.create!(name: "中村勇希", age: 29, sex: "男性", memo: "ハイボールはデュワーズで作る")
customer2 = Customer.create!(name: "nakamura", age: 29, sex: "男性", memo: "ハイボールはデュワーズで作る")
customer3 = Customer.create!(name: "yuuki", age: 29, sex: "男性", memo: "ハイボールはデュワーズで作る")
customer4 = Customer.create!(name: "ナカムラ", age: 29, sex: "男性", memo: "ハイボールはデュワーズで作る")
customer5 = Customer.create!(name: "ユウキ", age: 29, sex: "男性", memo: "ハイボールはデュワーズで作る")

category1 = Category.create!(name: "ドリンク")
category2 = Category.create!(name: "フード")

Menu.create!(name: "ハラディンカ", price: 780, category_id: category1.id)
Menu.create!(name: "ナドバクラット", price: 780, category_id: category1.id)
Menu.create!(name: "ハイボール", price: 580, category_id: category1.id)
Menu.create!(name: "鴨肉のゴロゴロ低温焼き", price: 880, category_id: category2.id)
Menu.create!(name: "オレガノビーフのローストビーフ", price: 880, category_id: category2.id)
Menu.create!(name: "ミックスナッツ", price: 480, category_id: category2.id)

puts "初期データの投入に成功しました！"
