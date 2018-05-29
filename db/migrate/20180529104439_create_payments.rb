class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.string :status
      t.references :contributions, foreign_key: true

      t.timestamps
    end
  end
end
