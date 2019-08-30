class RemoveJacketImagFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :jacket_image, :string
  end
end
