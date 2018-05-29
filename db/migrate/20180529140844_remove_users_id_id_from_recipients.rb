class RemoveUsersIdIdFromRecipients < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipients, :users_id_id
    add_reference :recipients, :user
end
