class AddSendTFirstNameToOrderHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :order_histories, :send_to_first_name, :string
  end
end
