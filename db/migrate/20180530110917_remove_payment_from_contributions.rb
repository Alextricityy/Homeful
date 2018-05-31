class RemovePaymentFromContributions < ActiveRecord::Migration[5.2]
  def change
    remove_column :contributions, :payment
    add_column :contributions, :payment, :jsonb
  end
end
