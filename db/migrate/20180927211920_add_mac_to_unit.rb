class AddMacToUnit < ActiveRecord::Migration[5.2]
  def change
    add_column :units, :mac_address, :string
  end
end
