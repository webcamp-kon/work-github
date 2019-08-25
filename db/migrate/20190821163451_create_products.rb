class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.timestamps
      t.text:jacket_image
      t.datetime:released_date
      t.integer:stock_quantity
      t.integer:price
      t.datetime:updated_at
      t.datetime:created_at
      t.boolean:is_selling
    end
  end
end
