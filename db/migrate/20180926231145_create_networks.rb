class CreateNetworks < ActiveRecord::Migration[5.2]
  def change
    create_table :networks do |t|
      t.string :name
      t.string :api_key
      t.string :network_id

      t.timestamps
    end
  end
end
