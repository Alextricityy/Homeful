class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :recipients, foreign_key: true
      t.string :title
      t.text :description
      t.string :category
      t.integer :cost
      t.integer :total_contributions
      t.boolean :purchased, default: false

      t.timestamps
    end
  end
end
