class AddSendTLastNameToOrderHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :order_histories, :send_to_last_name, :string
  end
end
