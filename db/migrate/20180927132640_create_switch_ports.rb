class CreateSwitchPorts < ActiveRecord::Migration[5.2]
  def change
    create_table :switch_ports do |t|
      t.integer :number
      t.boolean :is_managed
      t.references :unit, foreign_key: true

      t.timestamps
    end
  end
end
