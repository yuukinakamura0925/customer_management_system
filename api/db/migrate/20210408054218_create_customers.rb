class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.integer :id
      t.string :name
      t.integer :age
      t.string :sex
      t.string :memo

      t.timestamps
    end
  end
end
