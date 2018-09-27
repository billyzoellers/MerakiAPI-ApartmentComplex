class CreateSwitches < ActiveRecord::Migration[5.2]
  def change
    create_table :switches do |t|
      t.string :mac_address
      t.references :network, foreign_key: true

      t.timestamps
    end
  end
end
