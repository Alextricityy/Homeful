class AddPrimaryToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :primary, :boolean
  end
end
