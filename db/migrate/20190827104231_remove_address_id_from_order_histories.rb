class RemoveAddressIdFromOrderHistories < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_histories, :address_id, :string
  end
end
