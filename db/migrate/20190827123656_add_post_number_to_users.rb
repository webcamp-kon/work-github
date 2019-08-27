class AddPostNumberToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :post_number, :string
  end
end
