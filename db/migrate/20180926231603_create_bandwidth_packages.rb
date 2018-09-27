class CreateBandwidthPackages < ActiveRecord::Migration[5.2]
  def change
    create_table :bandwidth_packages do |t|
      t.string :name
      t.references :network, foreign_key: true
      t.string :group_policy_id

      t.timestamps
    end
  end
end
