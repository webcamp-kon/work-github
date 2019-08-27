class RemovePostNumberFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :post_number, :integer
  end
end
