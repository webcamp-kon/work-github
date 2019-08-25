class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.integer :address
      t.integer :post_number
      t.timestamps
    end
  end
end
