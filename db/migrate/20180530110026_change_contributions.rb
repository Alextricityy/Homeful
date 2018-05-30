class ChangeContributions < ActiveRecord::Migration[5.2]
  def change
    remove_column :contributions, :amount
    add_column :contributions, :item_sku, :string
    add_monetize :contributions, :amount, currency: { present:false }
    add_column :contributions, :payment, :jsonb
  end
end
