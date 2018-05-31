class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :dob, :date_of_birth
  end
end
