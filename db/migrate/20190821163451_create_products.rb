class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.timestamps
<<<<<<< HEAD
      t.text:jacket_image
      t.datetime:released_date
      t.integer:stock_quantity
      t.integer:price
      t.datetime:updated_at
      t.datetime:created_at
      t.boolean:is_selling
=======
      t.text :jacket_image
      t.datetime :released_date
      t.integer :stock_quantity
      t.integer :price
      t.datetime :updated_at
      t.datetime :created_at
      t.boolean :is_selling
>>>>>>> 17c5c59b8c92bb621e12e5922f7991b1949a58cf
    end
  end
end
