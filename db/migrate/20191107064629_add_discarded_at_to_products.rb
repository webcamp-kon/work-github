class AddDiscardedAtToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :discarded_at, :datetime
    add_index :products, :discarded_at
  end
end
