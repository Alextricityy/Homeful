class RenamePaymentInContributions < ActiveRecord::Migration[5.2]
  def change
    rename_column :contributions, :payment, :payment_info
  end
end
