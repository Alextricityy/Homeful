class ChangeColumnNameRecipients < ActiveRecord::Migration[5.2]
  def change
    rename_column :recipients, :dob, :date_of_birth
  end
end
