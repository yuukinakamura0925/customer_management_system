class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.integer :id
      t.string :name
      t.integer :price
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
