class OrdersReferenceColumn < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :order_detail, null: false, foreign_key: true
  end
end
