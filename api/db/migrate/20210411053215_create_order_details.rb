class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.references :order, null: false, foreign_key: true
      t.string :menu_name
      t.integer :menu_price
      t.timestamps
    end
  end
end
