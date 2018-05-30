class RemoveCostFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :cost
    add_monetize :items, :price, currency: { present: false }
  end
end
