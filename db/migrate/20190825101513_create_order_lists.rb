class CreateOrderLists < ActiveRecord::Migration[5.2]
  def change
    create_table :order_lists do |t|
      t.integer :order_history_id
      t.integer :product_id
      t.integer :amount
      t.integer :price
      t.timestamps
    end
  end
end
