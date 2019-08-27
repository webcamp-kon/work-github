class RemoveAddressFromAddress < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :address, :integer
  end
end
