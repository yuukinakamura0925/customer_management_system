class Menu < ApplicationRecord
  belongs_to :cart_detail, optional: true
  belongs_to :category, optional: true
  # name,priceどちらもないとデータベースに保存されない
  validates :name, :price, presence: true

end
