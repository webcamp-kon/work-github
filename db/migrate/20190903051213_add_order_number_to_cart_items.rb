class AddOrderNumberToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :order_number, :integer, default: 1
  end
end
