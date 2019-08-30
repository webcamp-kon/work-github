class AddJacketImageToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :jacket_image, :string
  end
end
