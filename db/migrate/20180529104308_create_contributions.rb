class CreateContributions < ActiveRecord::Migration[5.2]
  def change
    create_table :contributions do |t|
      t.integer :amount
      t.references :users, foreign_key: true
      t.text :message
      t.references :items, foreign_key: true

      t.timestamps
    end
  end
end
