class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      # t.integer :disc_id
      # t.references :cellphone, foreign_key: true
      t.string :title
      t.integer :oridinal_number
      t.timestamps
    end
  end
end
