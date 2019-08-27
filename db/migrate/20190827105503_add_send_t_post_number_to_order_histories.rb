class AddSendTPostNumberToOrderHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :order_histories, :send_to_post_number, :string
  end
end
