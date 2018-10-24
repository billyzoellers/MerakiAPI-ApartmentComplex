class AddNameToSwitch < ActiveRecord::Migration[5.2]
  def change
    add_column :switches, :name, :string
  end
end
