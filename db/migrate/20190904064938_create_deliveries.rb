class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :user_id
      t.string :address
      t.string :post_number
      t.string :telephone_number
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
