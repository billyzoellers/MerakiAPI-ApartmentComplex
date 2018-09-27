class AddSwitchToSwitchPorts < ActiveRecord::Migration[5.2]
  def change
    add_reference :switch_ports, :switch, foreign_key: true
  end
end
