class AddSendTAddressToOrderHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :order_histories, :send_to_address, :string
  end
end
