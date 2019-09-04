class AddOrdrNumberToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :order_number, :integer
  end
end
