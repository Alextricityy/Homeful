class RemoveUsersIdFromRecipients < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipients, :users_id
    add_reference :recipients, :user_id
 end
end
