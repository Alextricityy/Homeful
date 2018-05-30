class RemovePaymenyFromContributions < ActiveRecord::Migration[5.2]
  def change
    remove_column :contributions, :paymeny
    add_column :contributions, :payment, :jsonb
  end
end
