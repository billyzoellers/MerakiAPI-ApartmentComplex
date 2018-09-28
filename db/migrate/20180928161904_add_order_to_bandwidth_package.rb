class AddOrderToBandwidthPackage < ActiveRecord::Migration[5.2]
  def change
    add_column :bandwidth_packages, :display_order, :integer
  end
end
