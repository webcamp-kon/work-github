class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|
      t.integer:product_id
      t.integer:ordinal_number
      t.timestamps
    end
  end
end
