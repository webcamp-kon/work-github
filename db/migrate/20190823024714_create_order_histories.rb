class CreateOrderHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :order_histories do |t|
      t.integer :user_id
      t.string :address_id
      t.datetime :buy_date
      t.string :send_to_name
      t.integer :send_to_tel_number
      t.integer :step
      t.string :order_status
      t.integer :method_of_pay
      t.integer :sum
      t.integer :delivery_fee
      t.timestamps
    end
  end
end
