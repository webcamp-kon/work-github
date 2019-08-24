class AddDetailsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :artist_id, :integer
    add_column :products, :label_id, :integer
    add_column :products, :genre_id, :integer
  end
end
