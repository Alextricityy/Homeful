class RemoveTotalContributionsFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :total_contributions
    add_column :items, :total_contributions, :integer, default: 0
  end
end
