class RenameSwitchMac < ActiveRecord::Migration[5.2]
  def change
    rename_column :switches, :mac_address, :serial
  end
end
