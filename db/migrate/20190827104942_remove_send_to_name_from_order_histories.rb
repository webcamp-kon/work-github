class RemoveSendToNameFromOrderHistories < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_histories, :send_to_name, :string
  end
end
