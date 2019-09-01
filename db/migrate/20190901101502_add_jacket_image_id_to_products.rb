class AddJacketImageIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :jacket_image_id, :string
  end
end
