class UpdateIndexInTables < ActiveRecord::Migration[5.2]
  def change

    remove_column :contributions, :users_id
    remove_column :contributions, :items_id
    add_reference :contributions, :user
    add_reference :contributions, :item

    remove_column :items, :recipients_id
    add_reference :items, :recipient

    remove_column :locations, :recipients_id
    add_reference :locations, :recipient

    remove_column :payments, :contributions_id
    add_reference :payments, :location
  end
end
