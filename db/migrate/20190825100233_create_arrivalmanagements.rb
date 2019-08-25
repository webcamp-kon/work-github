class CreateArrivalmanagements < ActiveRecord::Migration[5.2]
  def change
    create_table :arrivalmanagements do |t|
      t.integer :product_id
      t.integer :arrival_number
      t.timestamps
    end
  end
end
