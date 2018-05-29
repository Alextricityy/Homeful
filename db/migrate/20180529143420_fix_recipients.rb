class FixRecipients < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipients, :user_id_id
    add_reference :recipients, :user
  end
end
