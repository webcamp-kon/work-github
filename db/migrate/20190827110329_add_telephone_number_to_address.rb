class AddTelephoneNumberToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :telephone_number, :string
  end
end
