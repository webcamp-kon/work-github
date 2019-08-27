class AddPostNumberToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :post_number, :string
  end
end
