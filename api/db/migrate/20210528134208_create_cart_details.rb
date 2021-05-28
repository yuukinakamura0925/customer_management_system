class CreateCartDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_details do |t|
      t.references :cart
      t.references :menu
      t.integer :qty
      t.integer :price
    end
  end
end
