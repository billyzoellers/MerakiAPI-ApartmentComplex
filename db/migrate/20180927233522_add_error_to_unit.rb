class AddErrorToUnit < ActiveRecord::Migration[5.2]
  def change
    add_column :units, :error, :string
  end
end
