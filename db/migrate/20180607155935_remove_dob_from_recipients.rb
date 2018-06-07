class RemoveDobFromRecipients < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipients, :date_of_birth
  end
end
